{pkgs, ...}: {
  xdg.configFile."vscode_flags" = {
    source = ./code-flags.conf;
    target = "code-flags.conf";
  };

  home.file = {
    ".clang-format".text = ''
      BasedOnStyle: LLVM
      IndentWidth: 4
      ColumnLimit: 80
      AlignAfterOpenBracket: AlwaysBreak
    '';
  };
}
