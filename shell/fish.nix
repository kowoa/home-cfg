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

      source "${config.home.homeDirectory}/.init-scripts/source-aliases.fish"

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

      # Clean PATH
      set -gx PATH $(python3 ${config.home.homeDirectory}/.init-scripts/clean-path.py)

      # Init zoxide
      zoxide init fish | source
    '';
  };
}
