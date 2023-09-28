{pkgs, ...}: {
  xdg.configFile."kitty" = {
    recursive = true;
    source = ./cfg;
    target = "kitty";
  };

  xdg.configFile."kitty_aliases" = {
    target = "bash/aliases/.kitty";
    text = ''
      alias icat="kitty +kitten icat"
      alias ssh="kitty +kitten ssh"
    '';
  };
}
