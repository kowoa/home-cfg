{config, pkgs, ...}: {
  xdg.configFile."hyprland" = {
    enable = true;
    recursive = true;
    source = ./cfg;
    target = "hypr";
  };

  home.file."scripts" = {
    enable = true;
    recursive = true;
    source = ./scripts;
    target = "bin";
  };
}
