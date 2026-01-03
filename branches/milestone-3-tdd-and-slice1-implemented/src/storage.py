from __future__ import annotations

import re
from pathlib import Path
from datetime import date
from typing import Dict, List

ROOT = Path(__file__).resolve().parent.parent
ADRS_DIR = (ROOT / "adrs").resolve()

_slug_re = re.compile(r"[^a-z0-9]+")

def _slugify(title: str) -> str:
    t = title.strip().lower()
    t = _slug_re.sub("-", t).strip("-")
    if not t:
        raise ValueError("Title must contain at least one alphanumeric character.")
    if ".." in t:
        raise ValueError("Invalid title.")
    return t[:60]

def _next_id() -> str:
    existing = sorted(ADRS_DIR.glob("ADR-????-*.md"))
    if not existing:
        return "ADR-0001"
    last = existing[-1].name.split("-", 2)[1]
    try:
        n = int(last)
    except ValueError:
        n = 0
    return f"ADR-{n+1:04d}"

def _safe_path(filename: str) -> Path:
    p = (ADRS_DIR / filename).resolve()
    if ADRS_DIR not in p.parents and p != ADRS_DIR:
        raise ValueError("Unsafe path.")
    return p

def _render_markdown(adr_id: str, title: str, status: str, content: str) -> str:
    frontmatter = (
        "---\n"
        f"id: {adr_id}\n"
        f"title: {title}\n"
        f"status: {status}\n"
        f"date: {date.today().isoformat()}\n"
        "---\n\n"
    )
    body = content.strip()
    if not body:
        body = "# Context\n\nTBD\n\n# Decision\n\nTBD\n\n# Consequences\n\nTBD\n\n# Alternatives\n\nTBD\n"
    return frontmatter + body + "\n"

def create_adr(title: str, status: str, content: str) -> Dict:
    ADRS_DIR.mkdir(parents=True, exist_ok=True)
    slug = _slugify(title)
    adr_id = _next_id()
    filename = f"{adr_id}-{slug}.md"
    path = _safe_path(filename)
    if path.exists():
        raise ValueError("ADR already exists.")
    path.write_text(_render_markdown(adr_id, title, status, content), encoding="utf-8")
    return {"id": adr_id, "filename": path.name}

def list_adrs() -> List[Dict]:
    ADRS_DIR.mkdir(parents=True, exist_ok=True)
    items = []
    for p in sorted(ADRS_DIR.glob("ADR-????-*.md")):
        parts = p.name.split("-", 2)
        items.append({"id": parts[0] + "-" + parts[1], "filename": p.name})
    return items

def get_adr(adr_id: str) -> Dict:
    if not re.fullmatch(r"ADR-\d{4}", adr_id):
        raise ValueError("Invalid ADR id format.")
    matches = list(ADRS_DIR.glob(f"{adr_id}-*.md"))
    if not matches:
        raise FileNotFoundError()
    p = matches[0].resolve()
    _ = _safe_path(p.name)
    return {"id": adr_id, "filename": p.name, "markdown": p.read_text(encoding="utf-8")}

def delete_adr(adr_id: str) -> None:
    if not re.fullmatch(r"ADR-\d{4}", adr_id):
        raise ValueError("Invalid ADR id format.")
    matches = list(ADRS_DIR.glob(f"{adr_id}-*.md"))
    if not matches:
        raise FileNotFoundError()
    p = matches[0].resolve()
    _ = _safe_path(p.name)
    p.unlink()
