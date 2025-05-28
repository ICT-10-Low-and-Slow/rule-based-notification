# notifier/main.py

from fastapi import FastAPI, BackgroundTasks
from core.event_listener import start_listening
from core.rule_loader import load_rules
from config import SETTINGS
import uvicorn

app = FastAPI(title="Rule-based Notification System")

rules = load_rules("rules.yaml")

@app.on_event("startup")
async def startup_event():
    print("System is starting up...")
    await start_listening(rules)

@app.get("/")
async def health_check():
    return {"status": "ok", "message": "System is running"}

if __name__ == "__main__":
    uvicorn.run("main:app", host=SETTINGS.HOST, port=SETTINGS.PORT, reload=True)
