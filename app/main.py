from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
import requests

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

OLLAMA_ENDPOINT = "http://localhost:11434/api/generate"
MODEL_NAME = "codellama:7b-instruct"

@app.post("/ask")
async def ask_code(request: Request):
    body = await request.json()
    prompt = body.get("prompt", "")

    payload = {
        "model": MODEL_NAME,
        "prompt": prompt,
        "stream": False
    }

    response = requests.post(OLLAMA_ENDPOINT, json=payload)
    result = response.json()
    return {"response": result.get("response", "").strip()}
