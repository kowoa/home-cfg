# Home Directory Configuration

Any package installed here with `home.packages = [...]` must be non-graphical.
Graphical packages should be installed through the OS's package manager.

## Getting Started

- `git clone https://github.com/kowoa/home-cfg.git ~/.home-cfg`
- `cd ~/.home-cfg`
- `./rebuild`

## Notes

- The `${xdg.configHome}/bash/aliases` directory contains files containing aliases.
  Whenever you want to add an alias for a specific application, add a file here.
- To configure the fish prompt, run `tide configure`

## Nix Notes

To add channels:
1. `nix-channel --add https://nixos.org/channels/nixos-23.05 nixpkgs`
1. `nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs-unstable`
1. `nix-channel --update`

Ways use an unstable package with `nix-shell`:
- `nix-shell -p '(import <nixpkgs-unstable> {}).PACKAGENAME'`
- `nix-shell -p PACKAGENAME -I nixpkgs=channel:nixos-CHANNELVERSION`

## Arch Linux Dependencies

- `gnome-keyring libsecret` for storing passwords
