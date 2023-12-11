local wezterm = require("wezterm")
local harfbuzz_features = {
  "calt",
  "liga",
  "dlig",
  "ss03",
  "ss04",
  "ss06",
  "ss07",
};

return {
  font = wezterm.font {
    family = "MonaspiceAr NF",
    harfbuzz_features = harfbuzz_features,
  },
  font_rules = {
    {
      intensity = "Normal",
      italic = false,
      font = wezterm.font {
        family = "MonaspiceAr NF",
        weight = "Regular",
        harfbuzz_features = harfbuzz_features,
      },
    },
    {
      intensity = "Half",
      italic = false,
      font = wezterm.font {
        family = "MonaspiceKr NF",
        weight = "Light",
        harfbuzz_features = harfbuzz_features,
      },
    },
    {
      intensity = "Bold",
      italic = false,
      font = wezterm.font {
        family = "MonaspiceKr NF",
        weight = "Bold",
        harfbuzz_features = harfbuzz_features,
      },
    },
    {
      intensity = "Normal",
      italic = true,
      font = wezterm.font {
        family = "MonaspiceAr NF",
        weight = "Regular",
        harfbuzz_features = harfbuzz_features,
      },
    },
    {
      intensity = "Half",
      italic = true,
      font = wezterm.font {
        family = "MonaspiceKr NF",
        weight = "Light",
        harfbuzz_features = harfbuzz_features,
      },
    },
    {
      intensity = "Bold",
      italic = true,
      font = wezterm.font {
        family = "MonaspiceKr NF",
        weight = "Bold",
        harfbuzz_features = harfbuzz_features,
      },
    },
  },
  font_size = 11,

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
