{pkgs, ...}: {
  xdg.configFile."kitty" = {
    enable = true;
    recursive = true;
    source = ./cfg;
    target = "kitty";
  };
}
