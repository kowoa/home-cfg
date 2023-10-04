{ pkgs, unstable, ... }: {
  home.packages = with pkgs; [
    fishPlugins.tide
    fishPlugins.sponge
    fishPlugins.z
    fishPlugins.done

    # Utils
    unstable.eza
    bat
    ripgrep
    neovim
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting

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
    shellAliases = {
      ls = "eza";
      cat = "bat";
      grep = "rg";
      nv = "nvim";
      icat = "kitty +kitten icat";
      ssh = "kitty +kitten ssh";
      "list-fonts" = "kitty +list-fonts";
    };
  };
}
