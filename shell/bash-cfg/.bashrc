# /etc/skel/.bashrc
#
# This file is sourced by non-login shells

# Do not change shell if inside nix shell. Stick with bash.
# This solves issue where the nix package doesn't appear in PATH on Linux.
# Start a nix-shell using `nix-shell --command "exec $SHELL"` to retain shell.
if [[ $IN_NIX_SHELL && $(uname) == "Linux" ]]; then
  return
fi

# IMPORTANT: Edit this to change the desired shell
exec fish

