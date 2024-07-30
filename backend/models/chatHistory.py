from mongo_engine import db

class ChatHistory(db.Document):
    category = db.StringField(required=True)
    message = db.StringField(required=True)

    @classmethod
    def add(cls, args):
        try:
            data = cls(**args).save()
            return {"error": False, "data": data}
        except Exception as e:
            return {"error": True, "message": str(e)}
        
    @classmethod
    def get_top_10(cls, category):
        try:
            data = cls.objects(category=category).limit(10)
            return {"error": False, "data": data}
        except Exception as e:
            return {"error": True, "message": str(e)}
        