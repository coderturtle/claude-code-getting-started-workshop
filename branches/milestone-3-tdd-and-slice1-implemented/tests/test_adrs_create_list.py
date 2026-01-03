# verifies we can create an ADR and then see it in the list
from fastapi.testclient import TestClient
from src.app import app

def test_create_and_list(tmp_path):
    import src.storage as storage
    storage.ADRS_DIR = tmp_path.resolve()

    client = TestClient(app)

    r = client.post("/adrs", json={"title": "My Decision", "status": "Proposed", "content": ""})
    assert r.status_code == 201, r.text
    created = r.json()
    assert created["id"].startswith("ADR-")
    assert created["filename"].endswith(".md")

    r2 = client.get("/adrs")
    assert r2.status_code == 200
    items = r2.json()
    assert len(items) == 1
    assert items[0]["filename"] == created["filename"]

def test_invalid_title_rejected(tmp_path):
    # verifies titles without alphanumerics are rejected (prevents empty/unsafe filenames)
    import src.storage as storage
    storage.ADRS_DIR = tmp_path.resolve()
    client = TestClient(app)
    r = client.post("/adrs", json={"title": "!!!", "status": "Proposed", "content": ""})
    assert r.status_code == 400
