from fastapi import FastAPI
from tinydb import TinyDB, Query

app = FastAPI()
db = TinyDB('db.json')

@app.get("/bins/{bin_id}")
def get_bin(bin_id: str):
    result = db.get(Query().id == bin_id)
    if result:
        return result["data"]
    else:
        return {}

@app.post("/bins/{bin_id}")
def create_bin(bin_id: str, data: dict):
    result = db.get(Query().id == bin_id)
    if result:
        db.update({"data": data}, Query().id == bin_id)
    else:
        db.insert({"id": bin_id, "data": data})
    
    result = db.get(Query().id == bin_id)

    return result["data"]