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

qa = RetrievalQA.from_chain_type(
  llm=llm,
  retriever=retriever,
  chain_type='stuff',
  verbose=False
)

prompt = """
    Act as an Health care expert. I will provide you my current health codition. You will predict all future diseases (maximum 3, minimum 2) which will require surgery/treatment when i get old based on my current health condition in a JSON format. No Introduction or outro, just the JSON object. <|im_end|> at end is also not allowed.
    output JSON format strictly: [{{ "disease name": "future disease name",
        "surgery name": "future surgery/treatment name"
    }},
    ...
    ]
    input: {current_health_conditions}
"""

prompt_template = PromptTemplate(
    input_variables=["current_health_conditions"],
    template=prompt
)

def predict_future_disease(current_health_conditions):
    response = qa.invoke(prompt_template.format(current_health_conditions=current_health_conditions))
    try:
        json_match = re.search(r'\[\s*{.*}\s*\]', response['result'], re.DOTALL)
        if json_match:
            response_json = json.loads(json_match.group(0))
            return response_json
        else:
            return {"error": "Failed to find JSON object in response", "response": response['result']}
    except json.JSONDecodeError:
        return {"error": "Failed to decode JSON response", "response": response['result']}