{ pkgs, ... }: {
  home.username = "kowoa";
  home.homeDirectory = "/home/kowoa";
  home.stateVersion = "23.05";
  targets.genericLinux.enable = true;

  nix.package = pkgs.nix;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  imports = [
    ./helix/mod.nix
  ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "kowoa";
    userEmail = "koadahoakodah@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "/usr/lib/git-core/git-credential-libsecret";
    };
  };


  home.packages = with pkgs; [
  ];
}