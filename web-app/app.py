from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles
from fastapi import FastAPI
import os

usernames = []

app = FastAPI()

static_path = os.path.join(os.path.dirname(__file__), "static")

app.mount("/static", StaticFiles(directory=static_path), name="static")

@app.get("/")
async def root() -> dict:
    return FileResponse("web-app/page.html")

@app.post("/login")
async def add_username(username: str) -> dict:
    if username and username not in usernames:
        usernames.append(username)
        return {"message": "Username added successfully"}
    return {"message": "Username already exists or invalid"}
