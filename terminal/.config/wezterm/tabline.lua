local wezterm = require("wezterm")

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

local function get_current_dir()
	return wezterm.get_current_working_dir()
end

function tabline.apply_to_config()
	tabline.setup({
		options = {
			theme = "Oxocarbon Dark (Gogh)",
			icons_enabled = true,

			section_separators = {
				left = wezterm.nerdfonts.ple_upper_left_triangle,
				right = wezterm.nerdfonts.ple_lower_right_triangle,
			},
			component_seperators = {
				left = wezterm.nerdfonts.ple_upper_left_triangle,
				right = wezterm.nerdfonts.ple_lower_right_triangle,
			},
			tab_separators = {
				left = wezterm.nerdfonts.ple_upper_left_triangle,
				right = wezterm.nerdfonts.ple_lower_right_triangle,
			},
		},
		sections = {
			tabline_a = { "mode" },
			tabline_b = { "window" },
			tabline_c = { "" },
			tab_active = { "tab_index", ":", "process" },
			tab_inactive = { "tab_index", ":", "process" },
			tabline_x = { "cpu", "ram" },
			tabline_y = { "datetime" },
			tabline_z = { "hostname" },
		},
	})
end

return tabline
