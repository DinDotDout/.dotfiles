local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.term = "xterm-256color"
config.font = wezterm.font("RobotoMono Nerd Font")
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
-- config.window_background_tint = 0.9

config.colors = {
	cursor_bg = "#FFFFFF",
	-- cursor_bg = "#CFFFFF",
	cursor_border = "#FFFFFF",
	-- cursor_fg = "#C5AE91",
	-- cursor_fg = "#000000",
}

config.window_frame = {
	font = wezterm.font({ family = "RobotoMono Nerd Font", weight = "Bold" }),
	font_size = 11.0,
}

config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}
config.font_size = 11.0
-- For future reference
--config.keys = {
--   {
--     key = 'E',
--     mods = 'CTRL',
--     action = wezterm.action.EmitEvent 'toggle-ligature',
--   },
-- },
return config
