from fastapi import FastAPI
from typing import Optional

app = FastAPI()

@app.get("/")
async def root() -> dict:
    return {"data": "Hello world!"}

@app.get("/questions")
async def main_page() -> dict:
    return {"data": questions}

questions = []
