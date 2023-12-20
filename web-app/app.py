from fastapi import FastAPI
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
import sqlite3
import os

app = FastAPI()

static_path = os.path.join(os.path.dirname(__file__), "static")

app.mount("/static", StaticFiles(directory=static_path), name="static")

conn = sqlite3.connect('questions.db')
cursor = conn.cursor()

# Create users and questions tables
cursor.execute("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT)")
cursor.execute("CREATE TABLE IF NOT EXISTS questions (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, question TEXT)")

@app.get("/")
async def root() -> dict:
    return FileResponse("web-app/page.html")

@app.post("/add-username/{username}")
async def add_username(username: str):
    cursor.execute("INSERT INTO users (username) VALUES (?)", (username,))
    conn.commit()
    return {"message": f"Username {username} added successfully"}

class QuestionData(BaseModel):
    username: str
    question: str

@app.post("/add-question")
async def add_question(data: QuestionData):
    cursor.execute("INSERT INTO questions (username, question) VALUES (?, ?)", (data.username, data.question))
    conn.commit()
    return {"message": f"Question {data.question} from {data.username} added successfully"}

@app.get("/get-questions")
async def get_questions():
    result = cursor.execute("SELECT username, question FROM questions").fetchall()
    questions = [{"username": row[0], "question": row[1]} for row in result]
    return {"questions": questions}