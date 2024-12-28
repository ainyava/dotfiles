local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "OneDark (base16)"
config.font = wezterm.font("ComicMonoNF")
config.window_background_opacity = 0.93

return config
