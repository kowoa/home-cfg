local wezterm = require("wezterm")
local font = require("iosevka-font")

return {
	-- Fonts
	font = font.font,
	font_rules = font.font_rules,
	font_size = font.font_size,

	-- Cursor
	default_cursor_style = "BlinkingBlock",
	animation_fps = 1,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 500,

	window_background_opacity = 0.95,
	warn_about_missing_glyphs = false,
	hide_tab_bar_if_only_one_tab = true,

	color_scheme = "kanagawabones",
	--color_scheme = "Catppuccin Mocha",
	--color_scheme = "duskfox",

	keys = {
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SpawnCommandInNewTab({
				args = { "bash" },
			}),
		},
	},
}
