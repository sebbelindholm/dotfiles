local wezterm = require("wezterm")

local appearence = {}

function appearence.apply_to_config(config)

    config.color_scheme = "OneDark (base16)"

    config.window_padding = {
        left = 0,
        right = 0,
        bottom = 0,
        top = 0,
    }
end

return appearence
