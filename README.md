# Home Directory Configuration

Any package installed here with `home.packages = [...]` must be non-graphical.
Graphical packages should be installed through the OS's package manager.

## Notes

To add channels:
1. `nix-channel --add https://nixos.org/channels/nixos-23.05 nixpkgs`
1. `nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs-unstable`
1. `nix-channel --update`

Ways use an unstable package with `nix-shell`:
- `nix-shell -p '(import <nixpkgs-unstable> {}).PACKAGENAME'`
- `nix-shell -p PACKAGENAME -I nixpkgs=channel:nixos-CHANNELVERSION`

Misc:
- The `${xdg.configHome}/bash/aliases` directory contains files containing aliases.
  Whenever you want to add an alias for a specific application, add a file here.

## Arch Linux Dependencies

- `gnome-keyring libsecret` for storing passwords
