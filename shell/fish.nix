{ pkgs, unstable, config, ... }: {
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

      source "${config.home.homeDirectory}/bin/shell/source-aliases.fish"

      # Autostart zellij
      if begin;
        command -q zellij;
        and not set -q ZELLIJ;
        and test "$TERM_PROGRAM" != "vscode";
      end;
        # Attach to the oldest session (last in the list) if available
        zellij attach --create $(zellij ls | tail -n 1)
      end

      if command -q pfetch
        pfetch
      end
    '';
  };
}
