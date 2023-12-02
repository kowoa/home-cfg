{ pkgs, ... }: {
  home.username = "kowoa";
  home.homeDirectory = "/home/kowoa";
  home.stateVersion = "23.11";
  targets.genericLinux.enable = true;

  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [
    ./helix/mod.nix
    ./kitty/mod.nix
    ./hyprland/mod.nix
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
      credential.helper = "/usr/lib/git-core/git-credential-libsecret";
      http.postBuffer = 157286400;
    };
  };

  home.packages = with pkgs; [
    rustup
    nodejs
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
