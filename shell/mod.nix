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
    zoxide
    unstable.eza
    bat
    ripgrep
    fd
    procs
    delta
    btop
    fzf
    tealdeer
    tree
    gitoxide

    # Extra
    neofetch
    unstable.pfetch-rs

    # Dependencies
    python3
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
        alias find="fd"
        alias ps="procs"
        alias nv="nvim"
        alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
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
      source = ./starship-cfg/starship.toml;
      target = "starship.toml";
    };
    "tealdeer" = {
      recursive = true;
      source = ./tealdeer-cfg;
      target = "tealdeer";
    };
  };

  home.file = {
    "init-scripts" = {
      recursive = true;
      source = ./init-scripts;
      target = ".init-scripts";
    };
    ".bash_profile".text = ''
      source "${config.home.homeDirectory}/.init-scripts/source-aliases.bash"

      # Custom scripts and binaries
      for DIR in ${config.home.homeDirectory}/bin/*/; do
        export PATH="$DIR:$PATH"
      done

      # Rust binaries
      export PATH="${config.home.homeDirectory}/.cargo/bin:$PATH"

      source ${config.xdg.configHome}/bash/.bash_profile
    '';
    ".bashrc".text = ''
      source "${config.home.homeDirectory}/.init-scripts/source-aliases.bash"

      # Custom scripts and binaries
      for DIR in ${config.home.homeDirectory}/bin/*/; do
        export PATH="$DIR:$PATH"
      done

      # Rust binaries
      export PATH="${config.home.homeDirectory}/.cargo/bin:$PATH"

      source ${config.xdg.configHome}/bash/.bashrc
    '';
    ".bash_logout".text = "source ${config.xdg.configHome}/bash/.bash_logout";
    ".zshrc".text = ''
      source "${config.home.homeDirectory}/.init-scripts/source-aliases.zsh"
      source ${config.xdg.configHome}/zsh/.zshrc
      export PATH=$(python3 ${config.home.homeDirectory}/.init-scripts/clean-path.py)
    '';
  };
}
