from flask_restful import Resource, reqparse
from predictionModels.predictTreatmentCost import predict_treatment_cost
from predictionModels.predictFutureDisease import predict_future_disease
from models.inflation import Inflation as InflationModel
import json

class PredictRetirementCorpus(Resource):

    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('current_expenses', type=dict, location='json', action='append', required=True, help="current_expenses is required")
        parser.add_argument('age', type=int, required=True, help="age is required")
        parser.add_argument('retirement_age', type=int, required=True, help="retirement_age is required")
        parser.add_argument('current_monthly_expense', type=int, required=True, help="current_monthly_expense is required")
        parser.add_argument('current_health_conditions', type=dict, location='json', action='append', required=True, help="current_health_conditions is required")

        args = parser.parse_args()

        current_expenses = args['current_expenses']

        response = InflationModel.get_all()
        if response.get("error"):
            return response, 500

        inflations = response.get("data")

        sorted_inflations = sorted(inflations, key=lambda x: (int(x['date'].split('/')[1]), int(x['date'].split('/')[0])), reverse=True)
       
        future_expenses = []
        most_recent_inflation = sorted_inflations[0]
        total_corpus = 0
        future_monthly_expense_start = 0
        future_monthly_expense_end = 0
        total_health_corpus = 0
        final_corpus = 0
        final_future_diseases = []

        for current_expense in current_expenses:
            category_corpus = 0
            future_expense = {}
            future_expense["name"] = current_expense["name"]
            future_expense["current_expense"] = current_expense["expense"]
            future_expense["inflation_rate"] = most_recent_inflation[current_expense['category']]
            future_expense['future_expense_start'] = current_expense['expense']
            future_expense['category_total'] = 0

            for i in range(args['age'], args['retirement_age']):
                future_expense['future_expense_start'] = round(future_expense['future_expense_start'] + ((future_expense['future_expense_start'] * most_recent_inflation[current_expense['category']]) / 100), 2)
            
            future_monthly_expense_start = round(future_monthly_expense_start + future_expense['future_expense_start'], 2)
            future_expense['future_expense_end'] = future_expense['future_expense_start']

            for i in range(args['retirement_age'], args['retirement_age'] + 30):
                future_expense['future_expense_end'] = round(future_expense['future_expense_end'] + ((future_expense['future_expense_end'] * most_recent_inflation[current_expense['category']]) / 100), 2)
                category_corpus += round((future_expense['future_expense_end'] * 12), 2)
                future_expense['category_total'] += category_corpus
            
            future_monthly_expense_end = round(future_monthly_expense_end + future_expense['future_expense_end'], 2)

            future_expenses.append(future_expense)
            total_corpus = round(total_corpus + category_corpus, 2)
        
        for current_health_condition in args['current_health_conditions']:
            current_health_condition_json = json.dumps(current_health_condition)
            future_diseases = predict_future_disease(current_health_conditions=current_health_condition_json)

            for future_disease in future_diseases:
                treatment_cost = predict_treatment_cost(disease=future_disease)
                future_disease["cost"] = float(treatment_cost.get("cost"))
                future_disease['inflation_considered_cost'] = future_disease["cost"]
                future_disease['health_inflation_rate'] = most_recent_inflation['health']
                for i in range(args['retirement_age'], args['retirement_age'] + 30):
                    future_disease['inflation_considered_cost'] = round(future_disease['inflation_considered_cost'] + ((future_disease['inflation_considered_cost'] * most_recent_inflation['health']) / 100), 2)
                    total_health_corpus = round(total_health_corpus + future_disease['inflation_considered_cost'], 2)
                final_future_diseases.append(future_disease)

        total_health_corpus = total_health_corpus/len(final_future_diseases)
        final_corpus = round(total_corpus + total_health_corpus, 2)

        data = {
            "current_monthly_expense": args['current_monthly_expense'],
            "future_monthly_expense_start": future_monthly_expense_start,
            "future_monthly_expense_end": future_monthly_expense_end,
            "total_corpus": total_corpus,
            "future_expenses": future_expenses,
            "current_health_conditions": args['current_health_conditions'],
            "future_diseases": final_future_diseases,
            "toatl_health_corpus": total_health_corpus,
            "final_corpus": final_corpus
        }

        return {"error": False, "data": data}, 200
