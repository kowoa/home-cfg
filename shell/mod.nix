{config, pkgs, unstable, ...}: {
  imports = [
    ./fish.nix
  ];

  home.packages = with pkgs; [
    # Shells
    bash
    zsh
    nushell

    # Multiplexer
    zellij

    # Prompt
    starship

    # Utils
    unstable.eza
    zoxide
    bat
    ripgrep
    fd
    btop
    delta

    # Extra
    neofetch
    unstable.pfetch-rs
  ];

  programs.git.extraConfig = {
    core.pager = "delta";
    interactive.diffFilter = "delta --color-only --features=interactive";
    delta.features = "decorations";
    delta."line-numbers" = true;
    "delta \"interactive\""."keep-plus-minus-markers" = false;
    "delta \"decorations\"" = {
      "commit-decoration-style" = "blue ol";
      "commit-style" = "raw";
      "file-style" = "omit";
      "hunk-header-decoration-style" = "blue box";
      "hunk-header-file-style" = "red";
      "hunk-header-line-number-style" = "\#067a00";
      "hunk-header-style" = "file line-number syntax";
    };
  };

  xdg.configFile = {
    "bash" = {
      recursive = true;
      source = ./bash-cfg;
      target = "bash";
    };
    "zsh" = {
      recursive = true;
      source = ./zsh-cfg;
      target = "zsh";
    };
    "nushell" = {
      recursive = true;
      source = ./nushell-cfg;
      target = "nushell";
    };
    "zellij" = {
      recursive = true;
      source = ./zellij-cfg;
      target = "zellij";
    };
    "starship" = {
      source = ./starship.toml;
      target = "starship.toml";
    };
  };

  home.file = with config; {
    ".bash_profile".text = ''
      BASH_ALIASES_DIR=${xdg.configHome}/bash/aliases
      shopt -s dotglob
      if [ -d "$BASH_ALIASES_DIR" ]; then
        for FILE in "$BASH_ALIASES_DIR"/*; do
          [ -r "$FILE" ] && . "$FILE"
          if [ -f "$FILE" ] && [ -r "$FILE" ]; then
            source "$FILE"
          fi
        done
      fi
      shopt -u dotglob

      source ${xdg.configHome}/bash/.bash_profile
    '';
    ".bashrc".text = ''
      BASH_ALIASES_DIR=${xdg.configHome}/bash/aliases
      shopt -s dotglob
      if [ -d "$BASH_ALIASES_DIR" ]; then
        for FILE in "$BASH_ALIASES_DIR"/*; do
          [ -r "$FILE" ] && . "$FILE"
          if [ -f "$FILE" ] && [ -r "$FILE" ]; then
            source "$FILE"
          fi
        done
      fi
      shopt -u dotglob

      source ${xdg.configHome}/bash/.bashrc
    '';
    ".bash_logout".text = "source ${xdg.configHome}/bash/.bash_logout";
    ".zshrc".text = ''
      BASH_ALIASES_DIR=${xdg.configHome}/bash/aliases
      setopt dotglob
      if [ -d "$BASH_ALIASES_DIR" ]; then
        for FILE in "$BASH_ALIASES_DIR"/*; do
          [ -r "$FILE" ] && . "$FILE"
          if [ -f "$FILE" ] && [ -r "$FILE" ]; then
            source "$FILE"
          fi
        done
      fi
      unsetopt dotglob

      source ${xdg.configHome}/zsh/.zshrc
    '';
  };
}
