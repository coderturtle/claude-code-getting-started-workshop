set -euo pipefail

# 1) Find repo root (works even if you're inside branches/)
REPO_ROOT="$(git rev-parse --show-toplevel)"
echo "==> Repo root: $REPO_ROOT"

# 2) Cache snapshot folders OUTSIDE the repo so git checkouts can't delete them
SNAP_CACHE="$(mktemp -d)"
trap 'rm -rf "$SNAP_CACHE"' EXIT
echo "==> Caching snapshots to: $SNAP_CACHE"

# Copy the entire branches folder to cache (stable source)
rsync -a "$REPO_ROOT/branches/" "$SNAP_CACHE/branches/"

# 3) Create a staging dir (rsync source stability)
STAGE_DIR="$(mktemp -d)"
trap 'rm -rf "$SNAP_CACHE" "$STAGE_DIR"' EXIT

# 4) Always operate from repo root (branches/ may vanish during checkout)
cd "$REPO_ROOT"

# Ensure a stable base branch exists
git checkout -B workshop/start
git add -A
git commit -m "chore: workshop scaffold" || true

declare -a MILESTONES=(
  "milestone-0-scaffold:milestone/0-scaffold"
  "milestone-1-hygiene-and-spec:milestone/1-hygiene-and-spec"
  "milestone-2-slice-plan:milestone/2-slice-plan"
  "milestone-3-tdd-and-slice1-implemented:milestone/3-tdd-and-slice1-implemented"
  "milestone-4-skills-and-adr:milestone/4-skills-and-adr"
  "milestone-5-guardrails:milestone/5-guardrails"
  "milestone-6-slice2-optional:milestone/6-slice2-optional"
  "milestone-solution:milestone/solution"
)

for item in "${MILESTONES[@]}"; do
  IFS=":" read -r DIR TAG <<< "$item"
  echo "==> Creating $TAG from $DIR"

  git checkout -B tmp/milestone workshop/start

  rm -rf "$STAGE_DIR/snap"
  mkdir -p "$STAGE_DIR/snap"

  # A) Copy snapshot into staging (stable)
  rsync -a --delete "$SNAP_CACHE/branches/$DIR/" "$STAGE_DIR/snap/"

  # B) Sync staged snapshot into repo root safely
  # IMPORTANT: exclude .git and branches so we don't delete our working materials
  rsync -a --delete \
    --exclude ".git/" \
    --exclude "branches/" \
    "$STAGE_DIR/snap/" ./

  git add -A
  git commit -m "milestone: $TAG"
  git tag -f "$TAG"

  git checkout workshop/start
done

git branch -D tmp/milestone || true

echo "✅ Tags created:"
git tag | grep "^milestone/" || true
