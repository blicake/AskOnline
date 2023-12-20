import uvicorn

if __name__ == "__main__":
    uvicorn.run("web-app.app:app", 
    port = 8000, reload = True)