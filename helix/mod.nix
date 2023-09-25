{pkgs, ...}: {
  home.packages = with pkgs; [
    helix
  ];

  xdg.configFile."helix" = {
    enable = true;
    recursive = true;
    source = ./cfg;
    target = "helix";
  };
}
