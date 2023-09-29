{config, pkgs, unstable, ...}: {
  home.packages = with pkgs; [
    bash
    zsh
    nushell
    starship
    unstable.eza
    bat
    zoxide
    neofetch
    ripgrep
  ];

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
