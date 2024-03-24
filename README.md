# Jason's dotfiles

I've never done the dotfiles thing before. But I'm giving nushell a go and am using this repo as a way to capture the things I try that will become part of my workfile.

## Setup

This repo is using git submodules. Because it's been 5 years since I last tried to use them and the pain is but a distant memory.

```sh
git clone https://github.com/jasononeil/dotfiles.git
git submodule init
git submodule update
```

## Linking

```sh
ln -s ~/workspace/dotfiles/fish/config.fish ~/.config/fish/
ln -s ~/workspace/dotfiles/home-manager/ ~/.config/home-manager
ln -s ~/workspace/dotfiles/nushell ~/Library/Application\ Support/
```
