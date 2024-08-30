local wezterm = require("wezterm")
local keybinds = require("keybinds")
local tabline = require("tabline")

local config = wezterm.config_builder()

keybinds.apply_to_config(config)
tabline.apply_to_config()

config.font = wezterm.font("Jetbrains Mono Nerd Font")
config.font_size = 14
config.line_height = 1.1
config.window_close_confirmation = "NeverPrompt"

config.color_scheme = "Oxocarbon Dark (Gogh)"

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

return config
