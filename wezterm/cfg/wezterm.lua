local wezterm = require("wezterm")
local fonts = require("fonts")

return {
	-- Fonts
	font = fonts.font,
	font_rules = fonts.font_rules,
	font_size = fonts.font_size,

	-- Cursor
	default_cursor_style = "BlinkingBlock",
	animation_fps = 1,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 500,

	window_background_opacity = 0.95,
	warn_about_missing_glyphs = false,
	hide_tab_bar_if_only_one_tab = true,

	--color_scheme = "kanagawabones",
	color_scheme = "Catppuccin Mocha",

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
