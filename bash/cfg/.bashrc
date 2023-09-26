# /etc/skel/.bashrc
#
# This file is sourced by non-login shells

source "$BASH_CONFIG_DIR/.bash_common"

#-------------------------------------------------------------------------------
# IMPORTANT: Edit this variable to change the default shell
SHELL=zsh

# Do not change shell if inside nix shell
# This solves issue where the nix package doesn't appear in PATH
# Start a nix-shell using `nix-shell --command "exec $SHELL"` to retain shell
if [[ $IN_NIX_SHELL ]]; then
  return
fi

exec $SHELL
#-------------------------------------------------------------------------------

