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

## NPM tools

The `global-npm-tools` has a PNPM project where we can `pnpm add <tool>` and any binaries that tool makes available will be on the path for the whole machine.
