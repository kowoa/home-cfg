{config, pkgs, ...}: {
  xdg.configFile."hyprland" = {
    recursive = true;
    source = ./cfg;
    target = "hypr";
  };

  home.file."hyprland-scripts" = {
    recursive = true;
    source = ./scripts;
    target = "bin/hyprland";
  };
}
