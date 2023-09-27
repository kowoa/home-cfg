{pkgs, unstable,...}: {
  home.packages = with pkgs; [
    helix
    nodePackages_latest.bash-language-server
    nodePackages_latest.vscode-css-languageserver-bin
    nodePackages_latest.vscode-html-languageserver-bin
    taplo
    unstable.csharp-ls
  ];

  xdg.configFile."helix" = {
    enable = true;
    recursive = true;
    source = ./cfg;
    target = "helix";
  };
}
