#!/usr/bin/env bash
set -euo pipefail

current_branch=$(git rev-parse --abbrev-ref HEAD)
org_and_repo=$(git remote get-url origin | sed 's|git@github.com:||;s|\.git$||')
git push --set-upstream origin "$current_branch"
open "https://github.com/${org_and_repo}/pull/new/${current_branch}"
