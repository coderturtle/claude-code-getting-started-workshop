#!/usr/bin/env bash
set -euo pipefail

CP="${1:-final}"

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

bold() { printf "\033[1m%s\033[0m\n" "$1"; }
ok() { printf "✅ %s\n" "$1"; }
warn() { printf "⚠️  %s\n" "$1"; }
fail() { printf "❌ %s\n" "$1"; exit 1; }

need_file() {
  local f="$1"
  [[ -f "$f" ]] || fail "Missing required file: $f"
}

need_dir() {
  local d="$1"
  [[ -d "$d" ]] || fail "Missing required directory: $d"
}

check_heading() {
  local f="$1"
  local h="$2"
  grep -q "$h" "$f" || fail "Expected heading '$h' in $f"
}

run_pytest_if_present() {
  if command -v pytest >/dev/null 2>&1; then
    bold "Running pytest..."
    pytest -q
    ok "pytest passed"
  else
    warn "pytest not found on PATH. If you have a venv, activate it first."
    warn "Skipping pytest. (This is okay for early checkpoints.)"
  fi
}

run_compileall() {
  if command -v python >/dev/null 2>&1; then
    bold "Running python compileall..."
    python -m compileall src tests >/dev/null 2>&1 || fail "compileall failed"
    ok "compileall passed"
  else
    warn "python not found; skipping compileall"
  fi
}


diff_budget_check() {
  # Soft warning only (does not fail)
  if command -v git >/dev/null 2>&1 && git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local files_changed
    files_changed="$(git diff --name-only | wc -l | tr -d ' ')"
    if [[ "$files_changed" -gt 3 ]]; then
      warn "Diff budget: more than 3 files changed in working tree ($files_changed). Consider splitting into smaller steps."
    fi
  fi
}

bold "Checkpoint: $CP"

diff_budget_check

need_dir "adrs"
need_dir "src"
need_dir "tests"

case "$CP" in
  spec)
    need_file "SPEC.md"
    check_heading "SPEC.md" "## Goal"
    check_heading "SPEC.md" "## API"
    check_heading "SPEC.md" "## Acceptance criteria"
    ok "SPEC.md looks reasonable"
    ;;

  plan)
    need_file "PLAN-SLICE.md"
    check_heading "PLAN-SLICE.md" "## Slice:"
    check_heading "PLAN-SLICE.md" "## Tests-first checklist"
    ok "PLAN-SLICE.md looks reasonable"
    ;;

  slice1)
    if [[ ! -f "src/app.py" && ! -f "src/main.py" ]]; then
      warn "No src/app.py or src/main.py found yet. If you're mid-lab, that's okay."
    else
      ok "Found app file"
    fi
    run_compileall
    run_pytest_if_present
    ;;

  skills)
    if ls adrs/ADR-0001-*.md >/dev/null 2>&1; then
      ADR="$(ls adrs/ADR-0001-*.md | head -n 1)"
      grep -q "^---$" "$ADR" || fail "ADR file missing frontmatter '---' lines: $ADR"
      grep -q "^id:" "$ADR" || fail "ADR file missing 'id:' in frontmatter: $ADR"
      grep -q "^status:" "$ADR" || fail "ADR file missing 'status:' in frontmatter: $ADR"
      ok "ADR-0001 exists and has basic frontmatter"
    else
      fail "Expected adrs/ADR-0001-*.md to exist"
    fi
    ;;

  guardrails)
    if [[ -f "README.md" ]] && grep -qi "traversal\|sanitize\|guardrail\|security" "README.md"; then
      ok "README mentions guardrails/security"
    elif [[ -f "src/storage.py" ]] && grep -qi "sanitize\|resolve\|traversal\|adrs" "src/storage.py"; then
      ok "storage module appears to contain guardrail logic"
    else
      warn "Couldn't detect guardrail notes automatically."
      warn "Make sure you implemented at least one mitigation and documented it."
    fi
    ;;

  final)
    [[ -f "SPEC.md" ]] && ok "SPEC.md present" || warn "SPEC.md missing (final expects it)"
    [[ -f "PLAN-SLICE.md" ]] && ok "PLAN-SLICE.md present" || warn "PLAN-SLICE.md missing (final expects it)"
    run_compileall
    run_pytest_if_present
    if ls adrs/ADR-0001-*.md >/dev/null 2>&1; then ok "ADR-0001 present"; else warn "ADR-0001 missing"; fi
    ok "Final checkpoint completed (warnings may remain)"
    ;;

  *)
    fail "Unknown checkpoint '$CP'. Use: spec | plan | slice1 | skills | guardrails | final"
    ;;
esac

bold "Done."
