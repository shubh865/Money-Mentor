import os
from dotenv import load_dotenv
load_dotenv()

from flask import Flask
from flask_cors import CORS
from flask_restful import Api
from mongo_engine import db

# from resources.inflation import Inflation
from resources.predictRetirementCorpus import PredictRetirementCorpus


app = Flask(__name__)
CORS(app)

app.config["MONGODB_HOST"] = os.getenv("MONGODB_URI")

db.init_app(app)

api = Api(app)

# api.add_resource(Inflation, '/inflation')
api.add_resource(PredictRetirementCorpus, '/predictRetirementCorpus')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)