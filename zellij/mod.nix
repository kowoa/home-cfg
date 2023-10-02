{ pkgs, ... }: {
  home.packages = with pkgs; [
    zellij
  ];

  xdg.configFile."zellij" = {
    recursive = true;
    source = ./cfg;
    target = "zellij";
  };
}
