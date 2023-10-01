{ pkgs, ... }: {
  home.packages = with pkgs; [
    fishPlugins.tide
    fishPlugins.sponge
    fishPlugins.z
    fishPlugins.done
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
}