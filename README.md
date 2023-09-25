# Home Directory Configuration

## Notes

To add channels:
1. `nix-channel --add https://nixos.org/channels/nixos-23.05 nixpkgs`
1. `nix-channel --add https://nixos.org/channels/nixos-unstable nixpkgs-unstable`
1. `nix-channel --update`

Ways use an unstable package with `nix-shell`:
- `nix-shell -p '(import <nixpkgs-unstable> {}).PACKAGENAME'`
- `nix-shell -p PACKAGENAME -I nixpkgs=channel:nixos-CHANNELVERSION`
