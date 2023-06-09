# RTX: Runtime Executor
# https://github.com/jdxcode/rtx
#
# This installs specific versions of runtimes (like Node, Go, Ruby etc) and sets the correct version for the project you're in.
# It is compatible with ASDF, but is written in Rust (and so faster, and I feel the docs are better).
#
# This file comes from installation instructions here: https://github.com/jdxcode/rtx#nushell
# I've modified the `export-env` to use more specific upserts so it doesn't clash with other hooks.

export-env {
  let-env RTX_SHELL = "nu"

  let-env config = ($env.config | upsert hooks.pre_prompt {|item| $item.hooks.pre_prompt | append {
    condition: {|| "RTX_SHELL" in $env }
    code: {|| rtx_hook }
  }})

  let-env config = ($env.config | upsert hooks.env_change.PWD {|item| $item.hooks.env_change.PWD | append {
    condition: {|| "RTX_SHELL" in $env }
    code: {|| rtx_hook }
  }})
}
  
def "parse vars" [] {
  $in | lines | parse "{op},{name},{value}"
}
  
def-env rtx [command?: string, --help, ...rest: string] {
  let commands = ["shell", "deactivate"]
  
  if ($command == null) {
    ^"/usr/local/bin/rtx"
  } else if ($command == "activate") {
    let-env RTX_SHELL = "nu"
  } else if ($command in $commands) {
    ^"/usr/local/bin/rtx" $command $rest
    | parse vars
    | update-env
  } else {
    ^"/usr/local/bin/rtx" $command $rest
  }
}
  
def-env "update-env" [] {
  for $var in $in {
    if $var.op == "set" {
      let-env $var.name = $"($var.value)"
    } else if $var.op == "hide" {
      hide-env $var.name
    }
  }
}

def-env rtx_hook [] {
  ^"/usr/local/bin/rtx" hook-env -s nu
    | parse vars
    | update-env
}

