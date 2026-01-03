from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field
from .storage import create_adr, list_adrs

app = FastAPI(title="ADR Pocket")

class AdrCreate(BaseModel):
    title: str = Field(min_length=1, max_length=120)
    status: str = Field(default="Proposed", max_length=40)
    content: str = Field(default="", max_length=50_000)

@app.get("/health")
def health():
    return {"status": "ok"}

@app.post("/adrs", status_code=201)
def create(payload: AdrCreate):
    try:
        return create_adr(payload.title, payload.status, payload.content)
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))

@app.get("/adrs")
def list_():
    return list_adrs()
