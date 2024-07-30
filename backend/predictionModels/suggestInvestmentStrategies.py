from langchain_huggingface import HuggingFaceEmbeddings
from langchain_chroma import Chroma
from langchain.chains import RetrievalQA
from langchain.prompts import PromptTemplate
import os
from langchain_openai import AzureOpenAI
from langchain_google_genai import ChatGoogleGenerativeAI

embeddings = HuggingFaceEmbeddings(model_name="all-MiniLM-L6-v2")
db = Chroma(persist_directory="./backend/chromaDB/investingPDFIndex", embedding_function=embeddings)

os.environ["OPENAI_API_VERSION"] = "2024-05-01-preview"
os.environ["AZURE_OPENAI_ENDPOINT"] = os.getenv("AZURE_OPENAI_ENDPOINT")
os.environ["AZURE_OPENAI_API_KEY"] = os.getenv("AZURE_OPENAI_API_KEY")
os.environ["TOKENIZERS_PARALLELISM"] = "false"
os.environ["GOOGLE_API_KEY"] = os.getenv("GEMINI")

llm = ChatGoogleGenerativeAI(model="gemini-pro", temperature=0.7, max_output_tokens=4000, convert_system_message_to_human=True)

# llm = AzureOpenAI(
#     deployment_name="Model1",
# )

retriever = db.as_retriever()

qa = RetrievalQA.from_chain_type(
  llm=llm,
  retriever=retriever,
  chain_type='stuff',
  verbose=False
)

prompt = """
    Act as an Expert Investment Strategist. Using your expertise Help me achieve my financial goals.
    I will provide you:
    1. investment purpose (e.g. retirement, education, etc.)
    2. initial investment amount (in INR)
    3. monthly investment amount (in INR)
    4. investment duration (in years)
    5. expected amount (in INR)

    You should respond with JSON object like below:
    [{
        "asset_name": "",
        "allocation_percentage": "",
        "expected_annual_return": "",
        "allocation_amount": "",
        "expected_return": "",
        "risk": ""
    },
    ...
    ]

    No intro, outro or explanation needed. Just Json response.
"""

prompt_template = PromptTemplate(
    input_variables=["current_health_conditions"],
    template=prompt
)

def suggest_investment_strategies(financial_goals):
    # response = qa.invoke(current_health_conditions)
    response = llm.invoke(financial_goals)
    return response.content
    # return response['result']
