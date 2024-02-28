local wezterm = require("wezterm")

local font = wezterm.font({
	family = "Cozette",
})

local font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = "CozetteVectorBold",
			weight = "Bold",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "CozetteVectorBold",
			weight = "Bold",
			style = "Italic",
		}),
	},
}

local font_size = 10

return {
	font = font,
	font_rules = font_rules,
	font_size = font_size,
}
