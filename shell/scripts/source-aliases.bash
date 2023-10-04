#!/usr/bin/env bash

ALIASES_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/shell-aliases"
shopt -s dotglob
if [ -d "$ALIASES_DIR" ]; then
for FILE in "$ALIASES_DIR"/*; do
  [ -r "$FILE" ] && . "$FILE"
  if [ -f "$FILE" ] && [ -r "$FILE" ]; then
    source "$FILE"
  fi
done
fi
shopt -u dotglob

