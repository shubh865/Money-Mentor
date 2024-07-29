import os
import json
import requests
from bs4 import BeautifulSoup
from flask_restful import Resource
from langchain.document_loaders import PyPDFLoader
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.embeddings import SentenceTransformerEmbeddings
from langchain.vectorstores import Chroma
from langchain.chat_models import ChatOpenAI
from langchain.chains import RetrievalQA
from langchain import HuggingFaceHub
from langchain.llms import Cohere
from models.inflation import Inflation as InflationModel

os.environ["OPENAI_API_KEY"] = os.getenv("OPENAI_API_KEY")
os.environ["HUGGINGFACEHUB_API_TOKEN"] = os.getenv("HUGGINGFACEHUB_API_TOKEN")
os.environ["TOKENIZERS_PARALLELISM"] = "False"

embeddings = SentenceTransformerEmbeddings(model_name="all-MiniLM-L6-v2")
llm = ChatOpenAI(model_name="gpt-3.5-turbo")
# llm=HuggingFaceHub(repo_id="nomic-ai/gpt4all-13b-snoozy", task="text-generation", model_kwargs={"temperature": 0.1, "max_length": 200})
# llm = Cohere(cohere_api_key=os.getenv("COHERE_API_KEY"))

retriever = None

def split_docs(documents, chunk_size=3200, chunk_overlap=50):
  text_splitter = RecursiveCharacterTextSplitter(chunk_size=chunk_size, chunk_overlap=chunk_overlap)
  docs = text_splitter.split_documents(documents)
  return docs


def get_inflation_pdf_links():
    url = "https://mospi.gov.in/press-release?field_press_release_category_tid=120"
    response = requests.get(url)

    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')
        links = soup.find_all('a')

        pdf_links = []
        for link in links:
            href = link.get('href')
            if href and href.endswith('.pdf') and 'CPI' in href:
                pdf_links.append(href)
        return pdf_links
    else:
        print(f"Failed to retrieve the web page. Status code: {response.status_code}")
    

def get_unique_pdf_links(processed_inflation_data, pdf_links):
    if len(processed_inflation_data) == 0:
        return pdf_links

    unique_pdf_links = []
    for pdf_link in pdf_links:
        is_present = False
        for data in processed_inflation_data:
            if data['pdf_link'] == pdf_link:
                is_present = True
                break
        if not is_present:
            unique_pdf_links.append(pdf_link)
        
    return unique_pdf_links
    

class Inflation(Resource):

    def get(self):

        pdf_links = get_inflation_pdf_links()

        response = InflationModel.get_all_pdf_links()
        if response['error']:
            return response, 500
        
        processed_inflation_data = response['data']

        pdf_links = get_unique_pdf_links(processed_inflation_data, pdf_links)

        pdf_links = pdf_links[:3]

        for pdf_link in pdf_links:

            loader = PyPDFLoader(pdf_link)
            pages = loader.load_and_split()

            pages = pages[3:4]

            docs = split_docs(pages)

            db = Chroma.from_documents(docs, embeddings)

            retriever = db.as_retriever(search_kwargs={"k": 1})

            qa_chain = RetrievalQA.from_chain_type(
                llm=llm,
                retriever=retriever,
                chain_type='stuff',
                verbose=False
            )

            prompt = """
                Give me the combd. inflation rate on Food and beverages, Fuel and light, Health, and General Index (All groups) inflation rate. If any value is not found, give answer as 0. Your reply should be in the form of a JSON object strictly adhering to the following format without any intro or outro: 
                {   
                    "date": "MM\YYYY (numeric)", 
                    "food_and_beverages": "", 
                    "fuel_and_light": "", 
                    "health": "", 
                    "inflation_rate" : "General Inflation rate"
                }
            """

            response = qa_chain.run(prompt)

            response = json.loads(response)
            response['food_and_beverages'] = float(response['food_and_beverages'])
            response['fuel_and_light'] = float(response['fuel_and_light'])
            response['health'] = float(response['health'])
            response['inflation_rate'] = float(response['inflation_rate'])
            response['pdf_link'] = pdf_link

            print(response)

            response = InflationModel.add(args=response)
            if response['error']:
                return response, 500
            
            db.delete(db.get()['ids'])
            
        return {"error": False, "message": "Successfully added inflation data"}, 200
