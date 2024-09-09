# This file can go in ~/.config/fish/config.fish
# Link it with `ln -s ~/workspace/dotfiles/fish/config.fish ~/.config/fish/`

# iTerm integration. Fetched from https://iterm2.com/documentation-shell-integration.html
source ~/workspace/dotfiles/fish/iterm2_shell_integration.fish

# Add rust
set PATH $HOME/.cargo/bin $PATH

# Direnv
source ~/workspace/dotfiles/fish/direnv.fish

# Add nix
set PATH $HOME/.nix-profile/bin $PATH
set PATH /nix/var/nix/profiles/default/bin/ $PATH

# Add Rancher Desktop
set PATH $HOME/.rd/bin $PATH

# Add mise (asdf compatible version switcher)
mise activate fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Jason's aliases
    alias gs="git status"
    alias gd="git diff"
    alias l="ls -la"
    alias newpr="~/workspace/dotfiles/scripts/newpr.nu"
    alias killport="~/workspace/dotfiles/scripts/killport.nu"
    alias gom="git rev-parse --abbrev-ref origin/HEAD"
    alias gm="basename (gom)"
    alias undo-commit="git reset --soft HEAD~1"

    # Set a CDPATH for fast directory switching to my code projects
    set -gx CDPATH $CDPATH . ~ $HOME/workspace $HOME/workspace/cultureamp
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/workspace/dotfiles/tabtab/fish/__tabtab.fish ]; and . ~/workspace/dotfiles/tabtab/fish/__tabtab.fish; or true
