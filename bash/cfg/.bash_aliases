alias starthl="$HOME/.config/hypr/starthl"
#alias create-loopback="$HOME/scripts/create-loopback"
#alias delete-loopback="$HOME/scripts/delete-loopback"
#alias http-server="python3 -m http.server -d ."
#alias pyvenv=". $HOME/pyvenv/bin/activate"
alias icat="kitty +kitten icat"
alias ssh="kitty +kitten ssh"
#
## This lazy-loads nvm to reduce startup times
#alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"
#
## This solves the issue where nix package doesn't appear in PATH
#alias nix-shell="nix-shell --command \"exec $SHELL\""
#
if command -v eza &> /dev/null; then
  alias ls="eza"
fi

if command -v bat &> /dev/null; then
  alias cat="bat"
fi

if command -v z &> /dev/null; then
  alias cd="z"
fi
