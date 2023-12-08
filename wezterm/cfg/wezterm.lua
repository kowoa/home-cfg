local wezterm = require("wezterm")

return {
  font = wezterm.font {
    family = "CozetteHiDpi",
    --family = "Cozette",
  },
  font_size = 18,

  -- Cursor
  default_cursor_style = "BlinkingBlock",
  animation_fps = 1,
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",
  cursor_blink_rate = 500,

  window_background_opacity = 0.95,
  warn_about_missing_glyphs = true,
  hide_tab_bar_if_only_one_tab = true,

  color_scheme = "kanagawabones",

  keys = {
    {
      key = "t",
      mods = "CTRL|SHIFT",
      action = wezterm.action.SpawnCommandInNewTab {
        args = { "bash" },
      },
    }
  },
}
