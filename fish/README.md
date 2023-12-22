# My fish setup

## Installation on OSX

Assuming these dotfiles are available at `~/workspace/dotfiles/`:

- Install fish: `brew install fish`
- Link the config: `ln -s ~/workspace/dotfiles/fish/config.fish ~/.config/fish/`
- Add it as an allowed login shell: `sudo echo /usr/local/bin/fish >> /etc/shells`
- Change your default shell: `chsh -s /usr/local/bin/fish`
