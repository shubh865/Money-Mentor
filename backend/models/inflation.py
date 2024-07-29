from mongo_engine import db

class Inflation(db.Document):
    date = db.StringField(required=True)
    food_and_beverages = db.FloatField(required=True)
    fuel_and_light = db.FloatField(required=True)
    health = db.FloatField(required=True)
    inflation_rate = db.FloatField(required=True)
    pdf_link = db.StringField(required=True)

    @classmethod
    def add(cls, args):
        try:
            data = cls(**args).save()
            return {"error": False, "data": data}
        except Exception as e:
            return {"error": True, "message": str(e)}
        
    @classmethod
    def get_all(cls):
        try:
            data = cls.objects.all()
            return {"error": False, "data": data}
        except Exception as e:
            return {"error": True, "message": str(e)}
        
    @classmethod
    def get_all_pdf_links(cls):
        try:
            data = cls.objects.all().only('pdf_link')
            return {"error": False, "data": data}
        except Exception as e:
            return {"error": True, "message": str(e)}