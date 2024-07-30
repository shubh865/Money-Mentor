import os
import json
from flask_restful import Resource, reqparse
from langchain_google_genai import ChatGoogleGenerativeAI
from models.chatHistory import ChatHistory as ChatHistoryModel

categories = {
    "1": "Act as an Expert of Credit monitoring and using your expertiese help the customer in a professional and polite manner. Give reponse in short, no long paragraphs and formatting",
    "2": "Act as an Expert Investment strategist and using your expertiese help the customer in a professional and polite manner. Give response in normal Text without any formatting",
    "3": "Act as an Expert of Retirement planning and using your expertiese help the customer in a professional and polite manner. Give response in normal Text without any formatting"
}

os.environ["TOKENIZERS_PARALLELISM"] = "false"
os.environ["GOOGLE_API_KEY"] = os.getenv("GEMINI")

llm = ChatGoogleGenerativeAI(model="gemini-pro", temperature=0.7, max_output_tokens=4000)

class Chat(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('category', type=str, required=True, help="category is required")
        parser.add_argument('message', type=str, required=True, help="message is required")
        args = parser.parse_args()

        message = args['message']
        category = args['category']

        chat_history = ChatHistoryModel.get_top_10(category)
        if chat_history["error"]:
            return {"error": True, "message": chat_history["message"]}
        
        new_message = "Past 10 messages:\n"
        for chat in chat_history["data"]:
            new_message += chat.message + "\n"


        new_message += categories[category] + "\n"
        new_message += message
        
        response = llm.invoke(new_message)

        ChatHistoryModel.add({"category": category, "message": message})
        ChatHistoryModel.add({"category": category, "message": response.content})

        return {"error": False, "data": response.content}
