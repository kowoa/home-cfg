{pkgs, unstable,...}: {
  home.packages = with pkgs; [
    helix
    nodePackages_latest.bash-language-server
    nodePackages_latest.vscode-css-languageserver-bin
    nodePackages_latest.vscode-html-languageserver-bin
    nodePackages_latest.yaml-language-server
    #unstable.csharp-ls # Doesn't work on macOS
    omnisharp-roslyn
    cmake-language-server
    nil # nix
  ];

  xdg.configFile."helix" = {
    enable = true;
    recursive = true;
    source = ./cfg;
    target = "helix";
  };
}
