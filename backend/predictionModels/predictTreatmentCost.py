from langchain_huggingface import HuggingFaceEmbeddings
from langchain_chroma import Chroma
from langchain.chains import RetrievalQA
from langchain.prompts import PromptTemplate
import os
import json
from langchain_openai import AzureOpenAI
import re

embeddings = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2")
db = Chroma(persist_directory="./backend/chromaDB/treatmentCostDB", embedding_function=embeddings)

os.environ["OPENAI_API_VERSION"] = "2024-05-01-preview"
os.environ["AZURE_OPENAI_ENDPOINT"] = os.getenv("AZURE_OPENAI_ENDPOINT")
os.environ["AZURE_OPENAI_API_KEY"] = os.getenv("AZURE_OPENAI_API_KEY")
os.environ["TOKENIZERS_PARALLELISM"] = "false"

llm = AzureOpenAI(
    deployment_name="Model1",
)

retriever = db.as_retriever()

prompt = """
  Act as an Health care expert. Give me the Treatment/surgery cost (indian rupees) of the given treatment/surgery from context. You should respond with just the treatment cost in number. No intro, outro, explanation or commas in number. Your reply should be in the form of a JSON object which has cost key and its value. If you don't know the cost, give approximate cost. Range is not allowed.
  Output Format Example:
  {{
    "cost": "100000"
  }}

  input (disease/surgery name): {disease}
"""

prompt_template = PromptTemplate(
    input_variables=["disease"],
    template=prompt
)

qa = RetrievalQA.from_chain_type(
    llm=llm,
    retriever=retriever,
    chain_type='stuff',
    verbose=False
)

def predict_treatment_cost(disease):
    response = qa.invoke(prompt_template.format(disease=disease.get("surgery name")))
    try:
        json_match = re.search(r'\{\s*"cost"\s*:\s*"\d+"\s*\}', response['result'], re.DOTALL)
        if json_match:
            response_json = json.loads(json_match.group(0))
            return response_json
        else:
            return {"error": "Failed to find JSON object in response", "response": response['result']}
    except json.JSONDecodeError:
        return {"error": "Failed to decode JSON response", "response": response['result']}

