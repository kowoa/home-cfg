# Home Directory Configuration

Any package installed here with `home.packages = [...]` must be non-graphical/terminal-only.
Graphical packages should be installed through the OS's package manager.
It is possible to install graphical apps, but save yourself some pain.

## Getting Started

- `git clone https://github.com/kowoa/home-cfg.git ~/.home-cfg`
- `cd ~/.home-cfg`
- `./rebuild`

## Notes

- The `~/.config/shell-aliases` directory contains files containing aliases.
  Whenever you want to add an alias for a specific application, add a file here.
  - The `~/bin/shell/source-aliases` scripts sources all files in `~/.config/shell-aliases`.

Here is an example of adding an aliases file for Kitty:
```bash
xdg.configFile."kitty_aliases" = {
  target = "shell-aliases/kitty";
  text = ''
    alias icat="kitty +kitten icat"
    alias ssh="kitty +kitten ssh"
    alias list-fonts="kitty +list-fonts"
  '';
};
```

- To configure the fish prompt, run `tide configure`.

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
- `kitty` terminal

## Troubleshooting (macOS)

To fix this error that occurs when running `./rebuild`:
```
Could not find suitable profile directory, tried /Users/kodah/.local/state/home-manager/profiles and /nix/var/nix/profiles/per-user/kodah
```
- `nix-channel --update`
- `./rebuild`

To fix this error that occurs when running `./rebuild`:
```
installing 'home-manager-path'
error: opening lock file '/nix/var/nix/profiles/per-user/kodah/profile.lock': No such file or directory
```
- `sudo mkdir /nix/var/nix/profiles/per-user/kodah`
- `sudo chown kodah /nix/var/nix/profiles/per-user/kodah`
- `./rebuild`

