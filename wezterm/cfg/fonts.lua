local wezterm = require("wezterm")

local harfbuzz_features = {
  "calt",
  "liga",
  "dlig",
  "ss03",
  "ss04",
  "ss06",
  "ss07",
}

local font = wezterm.font {
  family = "MonaspiceAr NF",
  harfbuzz_features = harfbuzz_features,
}

local font_rules = {
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
      style = "Italic",
      harfbuzz_features = harfbuzz_features,
    },
  },
  {
    intensity = "Half",
    italic = true,
    font = wezterm.font {
      family = "MonaspiceKr NF",
      weight = "Light",
      style = "Italic",
      harfbuzz_features = harfbuzz_features,
    },
  },
  {
    intensity = "Bold",
    italic = true,
    font = wezterm.font {
      family = "MonaspiceKr NF",
      weight = "Bold",
      style = "Italic",
      harfbuzz_features = harfbuzz_features,
    },
  },
}

local font_size = 10;

return {
  font = font,
  font_rules = font_rules,
  font_size = font_size,
}
