local wezterm = require("wezterm")

local font = wezterm.font({
	family = "Iosevka Custom",
})

local font_rules = {}

local font_size = 10

return {
	font = font,
	font_rules = font_rules,
	font_size = font_size,
}
