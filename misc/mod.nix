{pkgs, ...}: {
  xdg.configFile."vscode_flags" = {
    source = ./code-flags.conf;
    target = "code-flags.conf";
  };
}
