# verifies traversal-like titles are rejected so we can't write outside ./adrs
from fastapi.testclient import TestClient
from src.app import app

def test_traversal_like_title_rejected(tmp_path):
    import src.storage as storage
    storage.ADRS_DIR = tmp_path.resolve()
    client = TestClient(app)
    r = client.post("/adrs", json={"title": "../evil", "status": "Proposed", "content": ""})
    assert r.status_code == 400
