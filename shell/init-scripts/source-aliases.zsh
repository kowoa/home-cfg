#!/usr/bin/env zsh

ALIASES_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/shell-aliases"
setopt dotglob
if [ -d "$ALIASES_DIR" ]; then
for FILE in "$ALIASES_DIR"/*; do
  [ -r "$FILE" ] && . "$FILE"
  if [ -f "$FILE" ] && [ -r "$FILE" ]; then
    source "$FILE"
  fi
done
fi
unsetopt dotglob

