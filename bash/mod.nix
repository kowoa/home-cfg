{config, pkgs, unstable, ...}: {
  home.packages = with pkgs; [
    bash
    zsh
    starship
    unstable.eza
    bat
    zoxide
    neofetch
  ];

  xdg.configFile."bash" = {
    enable = true;
    recursive = true;
    source = ./cfg;
    target = "bash";
  };

  home.file = with config; {
    ".bash_profile".text = ''
      export BASH_CONFIG_DIR=${xdg.configHome}/bash
      source $BASH_CONFIG_DIR/.bash_profile;
    '';
    ".bashrc".text = ''
      export BASH_CONFIG_DIR=${xdg.configHome}/bash
      source $BASH_CONFIG_DIR/.bashrc
    '';
    ".bash_logout".text = "source ${xdg.configHome}/bash/.bash_logout";
    ".zshrc".text = "source ${xdg.configHome}/bash/.zshrc";
  };
}
