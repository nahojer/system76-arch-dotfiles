local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- OpenGL for GPU acceleration, Software for CPU
config.front_end = "OpenGL"

	-- Colors
config.color_scheme = 'Atelier Dune Light (base16)'
-- config.color_scheme = 'AdventureTime'

	-- Transparency
config.window_background_opacity = 1

	-- Font
config.font_size = 10
config.line_height = 1.0
config.dpi = 96.0

-- Padding
local horizontalPadding = 5;
local verticalPadding = 5;
config.window_padding = {
	left = horizontalPadding,
	right = horizontalPadding,
	top = verticalPadding,
	bottom = verticalPadding,
}

-- Tab Bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = true

-- General
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"

return config
