# verifies we can fetch and delete an ADR by id (Slice 2)
from fastapi.testclient import TestClient
from src.app import app

def test_get_and_delete(tmp_path):
    import src.storage as storage
    storage.ADRS_DIR = tmp_path.resolve()
    client = TestClient(app)

    r = client.post("/adrs", json={"title": "Decision", "status": "Proposed", "content": ""})
    assert r.status_code == 201
    adr_id = r.json()["id"]

    r2 = client.get(f"/adrs/{adr_id}")
    assert r2.status_code == 200
    assert "markdown" in r2.json()

    r3 = client.delete(f"/adrs/{adr_id}")
    assert r3.status_code == 204

    r4 = client.get(f"/adrs/{adr_id}")
    assert r4.status_code == 404
