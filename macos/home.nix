{ pkgs, ... }: {
  home.username = "kodah";
  home.homeDirectory = "/home/kodah";
  home.stateVersion = "23.05";

  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [
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
}