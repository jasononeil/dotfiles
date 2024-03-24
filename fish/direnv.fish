# Based on file created by https://github.com/cultureamp/devbox-extras/edit/main/scripts/bootstrap.sh
set -gx DIRENV_BIN "/Users/jason.oneil/.nix-profile/bin/direnv"
$DIRENV_BIN hook fish | source
# Setting the NIX_SSL_CERT_FILE thing required for Netskope / Devbox / Nix to play nice.
set -gx NIX_SSL_CERT_FILE '/Library/Application Support/Netskope/STAgent/data/nscacert_combined.pem'
