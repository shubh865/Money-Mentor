from flask_restful import Resource, reqparse
from predictionModels.suggestInvestmentStrategies import suggest_investment_strategies
import json

class SuggestInvestmentStrategies(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('InvestmentPurpose', type=str, required=True, help="InvestmentPurpose is required")
        parser.add_argument('InitialInvestmentAmount', type=str, required=True, help="InitialInvestmentAmount is required")
        parser.add_argument('MonthlyInvestmentAmount', type=str, required=True, help="MonthlyInvestmentAmount is required")
        parser.add_argument('InvestmentDuration', type=str, required=True, help="InvestmentDuration is required")
        parser.add_argument('ExpectedAmount', type=str, required=True, help="ExpectedAmount is required")

        args = parser.parse_args()

        financial_goals = {
            "InvestmentPurpose": args['InvestmentPurpose'],
            "InitialInvestmentAmount": args['InitialInvestmentAmount'],
            "MonthlyInvestmentAmount": args['MonthlyInvestmentAmount'],
            "InvestmentDuration": args['InvestmentDuration'],
            "ExpectedAmount": args['ExpectedAmount']
        }

        stringified_financial_goals = json.dumps(financial_goals)

        response = suggest_investment_strategies(stringified_financial_goals)
        return {"error": False, "data": response}