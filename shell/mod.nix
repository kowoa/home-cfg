{config, pkgs, unstable, ...}: {
  imports = [
    ./fish.nix
  ];

  home.packages = with pkgs; [
    # Shells
    bash
    zsh
    nushell

    # Prompt
    starship

    # Utils
    unstable.eza
    bat
    ripgrep
    fd
    btop
    delta
    zoxide

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
    "default-aliases" = {
      target = "shell-aliases/default";
      text = ''
        alias ls="eza"
        alias cat="bat"
        alias grep="rg"
        alias nv="nvim"
      '';
    };
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

  home.file = {
    "shell-scripts" = {
      recursive = true;
      source = ./scripts;
      target = "bin/shell";
    };
    ".bash_profile".text = ''
      source "${config.home.homeDirectory}/bin/shell/source-aliases.bash"

      # Custom scripts and binaries
      for DIR in ${config.home.homeDirectory}/bin/*/; do
        PATH="$DIR:$PATH"
      done

      source ${config.xdg.configHome}/bash/.bash_profile
    '';
    ".bashrc".text = ''
      source "${config.home.homeDirectory}/bin/shell/source-aliases.bash"

      # Custom scripts and binaries
      for DIR in ${config.home.homeDirectory}/bin/*/; do
        PATH="$DIR:$PATH"
      done

      source ${config.xdg.configHome}/bash/.bashrc
    '';
    ".bash_logout".text = "source ${config.xdg.configHome}/bash/.bash_logout";
    ".zshrc".text = ''
      source "${config.home.homeDirectory}/bin/shell/source-aliases"
      source ${config.xdg.configHome}/zsh/.zshrc
    '';
  };
}
