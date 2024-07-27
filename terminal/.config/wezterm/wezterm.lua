local wezterm = require("wezterm")
local keybinds = require("keybinds")
local appearence = require("appearence")
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

local config = wezterm.config_builder()

keybinds.apply_to_config(config)
appearence.apply_to_config(config)
--bar.apply_to_config(config)

config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 14
config.color_scheme = "One Dark (Gogh)"
config.line_height = 1.1
config.window_close_confirmation = "NeverPrompt"

config.color_scheme = "OneDark (base16)"

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

return config
