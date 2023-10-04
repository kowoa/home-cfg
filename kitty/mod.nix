{pkgs, ...}: {
  xdg.configFile."kitty" = {
    recursive = true;
    source = ./cfg;
    target = "kitty";
  };

  xdg.configFile."kitty_aliases" = {
    target = "shell-aliases/kitty";
    text = ''
      alias icat="kitty +kitten icat"
      alias ssh="kitty +kitten ssh"
      alias list-fonts="kitty +list-fonts"
    '';
  };
}
