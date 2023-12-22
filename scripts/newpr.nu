#!/usr/bin/env nu

def newpr [] {
  let current_branch = (git rev-parse --abbrev-ref HEAD)
  let org_and_repo = (git remote get-url origin | str replace "git@github.com:" '' | str replace ".git" '')
  git push --set-upstream origin $current_branch; ^open $"https://github.com/($org_and_repo)/pull/new/($current_branch)"
}

newpr