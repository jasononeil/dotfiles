# Direnv: unclutter your profile
# https://direnv.net/
#
# Direnv sets environment variables for the current project when you enter the directory.
# It does this based on a `.envrc` file.
#
# Installation instructions started here: https://www.nushell.sh/cookbook/direnv.html
# I've changed the upsert to make it less likely to clash with other hooks.
export-env {
  let-env config = ($env.config | upsert hooks.pre_prompt {|item| $item.hooks.pre_prompt | append { || 
    let direnv = (direnv export json | from json)
    let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
    $direnv | load-env
  }})
}