set -euo pipefail

PACK_DIR=""

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
  rsync -a --delete "${PACK_DIR}/branches/${DIR}/" ./

  git add -A
  git commit -m "milestone: $TAG"
  git tag -f "$TAG"

  git checkout workshop/start
done

git branch -D tmp/milestone || true
echo "✅ Tags created:"
git tag | grep "^milestone/" || true