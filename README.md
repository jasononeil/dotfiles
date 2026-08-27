# Jason's dotfiles

A repo to capture config and dotfiles that are part of my workflow.

## Setup

```sh
git clone https://github.com/jasononeil/dotfiles.git
```

## Linking

```sh
ln -s ~/workspace/dotfiles/fish/config.fish ~/.config/fish/
ln -s ~/workspace/dotfiles/home-manager/ ~/.config/home-manager
ln -s ~/workspace/dotfiles/devbox-global/ ~/.local/share/devbox/global/default
ln -s ~/.local/share/devbox/global/default ~/.local/share/devbox/global/current
```

## Claude Skills

Skills for agents are declared in `agents/skills.json`. Each entry has:

- `name` — the skill name (used as the symlink name under `~/.claude/skills/`)
- `repo` — git repo to clone
- `subdirectory` — (optional) path within the repo to link; omit to link the whole repo

Run the update script to clone/update all skills and create symlinks:

```sh
bash agents/update-skills.sh
```

Requires `jq`. Add it via `devbox add jq` if missing.

## NPM tools

The `global-npm-tools` has a PNPM project where we can `pnpm add <tool>` and any binaries that tool makes available will be on the path for the whole machine.
