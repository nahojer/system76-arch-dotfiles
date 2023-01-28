-- local wezterm = require("wezterm")

local horizontalPadding = 10;
local verticalPadding = 10;

return {
	-- OpenGL for GPU acceleration, Software for CPU
	front_end = "OpenGL",

	-- Colors
	-- color_scheme = 'Grayscale Light (base16)',
	color_scheme = 'Dracula',

	-- Font
	font_size = 13,
	line_height = 1.0,
	dpi = 96.0,

	-- Padding
	window_padding = {
		left = horizontalPadding,
		right = horizontalPadding,
		top = verticalPadding,
		bottom = verticalPadding,
	},

	-- Tab Bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
	tab_bar_at_bottom = true,

	-- General
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
}
