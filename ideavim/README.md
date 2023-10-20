Caveats:
- Pressing `w` or `W` near the end of the line could select the rest of the line
  and the beginning the next line too. This can be annoying. If it happens, just
  press `b` to go back to the previous line or use `e`/`E` instead of `w`/`W`.
- Adding a number prefix to `x` does nothing. For example, the example behavior
  of `3x` is to select the next 3 lines. Unfortunately, I could not get this to
  work because IdeaVim does not properly support `v:count`.