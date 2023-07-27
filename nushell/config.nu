# Set up an empty config. 
# This allows using `let-env config = ($env.config | upsert hooks { ... })` later.
let-env config = {
    hooks: {
      pre_prompt: [],
      env_change: {
        PWD: []
      }
    }
}

# Jason's aliases
alias gs = git status
alias gd = git diff
alias l = ls -la

def newpr [] {
  let current_branch = (git rev-parse --abbrev-ref HEAD)
  let org_and_repo = (git remote get-url origin | str replace "git@github.com:" '' | str replace ".git" '')
  git push --set-upstream origin $current_branch; ^open $"https://github.com/($org_and_repo)/pull/new/($current_branch)"
}

# Shell integrations / helpers
use ~/workspace/dotfiles/nushell/direnv.nu
use ~/workspace/dotfiles/nushell/rtx.nu
use ~/workspace/dotfiles/nushell/goto.nu main
