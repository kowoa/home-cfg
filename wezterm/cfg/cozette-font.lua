local wezterm = require("wezterm")

local font = wezterm.font({
	family = "Cozette",
})

local font_rules = {
	{
		intensity = "Normal",
		italic = false,
		font = wezterm.font({
			family = "Cozette",
		}),
	},
	{
		intensity = "Half",
		italic = false,
		font = wezterm.font({
			family = "Cozette",
		}),
	},
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "CozetteVectorBold",
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "CozetteVector",
			style = "Italic",
		}),
	},
	{
		intensity = "Half",
		italic = true,
		font = wezterm.font({
			family = "CozetteVector",
			style = "Italic",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "CozetteVectorBold",
			style = "Italic",
		}),
	},
}

local font_size = 9

return {
	font = font,
	font_rules = font_rules,
	font_size = font_size,
}
