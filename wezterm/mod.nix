{pkgs, ...}: {
  xdg.configFile."wezterm" = {
    recursive = true;
    source = ./cfg;
    target = "wezterm";
  };

  xdg.configFile."wezterm_aliases" = {
    target = "shell-aliases/wezterm";
    text = ''
      alias wezterm="wezterm start -- bash"
    '';
  };
}
