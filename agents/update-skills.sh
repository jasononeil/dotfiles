#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
CACHE_DIR="$SCRIPT_DIR/.skills-cache"
SKILLS_JSON="$SCRIPT_DIR/skills.json"
CLAUDE_SKILLS_DIR="$HOME/.claude/skills"

# Check dependencies
if ! command -v jq &>/dev/null; then
  echo "error: jq is required but not found. Install it via: devbox add jq" >&2
  exit 1
fi

mkdir -p "$CACHE_DIR"
mkdir -p "$CLAUDE_SKILLS_DIR"

skill_count=$(jq 'length' "$SKILLS_JSON")

for i in $(seq 0 $((skill_count - 1))); do
  name=$(jq -r ".[$i].name" "$SKILLS_JSON")
  repo=$(jq -r ".[$i].repo" "$SKILLS_JSON")
  subdirectory=$(jq -r ".[$i].subdirectory // empty" "$SKILLS_JSON")

  clone_dir="$CACHE_DIR/$name"

  echo "==> $name"

  if [ -d "$clone_dir" ]; then
    echo "    Updating from $repo"
    git -C "$clone_dir" fetch --depth=1 origin HEAD
    git -C "$clone_dir" reset --hard FETCH_HEAD
  else
    echo "    Cloning $repo"
    git clone --depth=1 "$repo" "$clone_dir"
  fi

  if [ -n "$subdirectory" ]; then
    target="$clone_dir/$subdirectory"
  else
    target="$clone_dir"
  fi

  if [ ! -e "$target" ]; then
    echo "    error: target path does not exist: $target" >&2
    exit 1
  fi

  ln -sfn "$target" "$CLAUDE_SKILLS_DIR/$name"
  echo "    Linked -> $CLAUDE_SKILLS_DIR/$name"
done

echo ""
echo "Done. $skill_count skill(s) updated."
