# This file can go in ~/.config/fish/config.fish
# Link it with `ln -s ~/workspace/dotfiles/fish/config.fish ~/.config/fish/`

# iTerm integration. Fetched from https://iterm2.com/documentation-shell-integration.html
source ~/workspace/dotfiles/fish/iterm2_shell_integration.fish

# RTX version switcher https://github.com/jdx/rtx
rtx activate fish | source

# Add rust
set PATH $HOME/.cargo/bin $PATH

if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # Jason's aliases
    alias gs="git status"
    alias gd="git diff"
    alias l="ls -la"
    alias newpr="~/workspace/dotfiles/scripts/newpr.nu"

    # Set a CDPATH for fast directory switching to my code projects
    set -gx CDPATH $CDPATH . ~ $HOME/workspace $HOME/workspace/cultureamp
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/workspace/dotfiles/tabtab/fish/__tabtab.fish ]; and . ~/workspace/dotfiles/tabtab/fish/__tabtab.fish; or true
