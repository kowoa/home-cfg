{ pkgs, ... }: {
  home.username = "kodah";
  home.homeDirectory = "/Users/kodah";
  home.stateVersion = "23.11";

  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [
    ./helix/mod.nix
    ./kitty/mod.nix
    ./wezterm/mod.nix
    ./shell/mod.nix
    ./misc/mod.nix
    ./zellij/mod.nix
  ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "kowoa";
    userEmail = "koadahoakodah@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      http.postBuffer = 157286400;
    };
  };

  home.packages = with pkgs; [
    rustup
    neovim
  ];

  # Config file for IdeaVim (JetBrains IDEs)
  home.file = {
    ".ideavimrc" = {
      source = ./ideavim/.ideavimrc;
      target = ".ideavimrc";
    };
  };
}
