return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
        
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            hightlight = { enable = true },
            autoinstall = true,
            indent = { enable = true },
        })
    end
}
