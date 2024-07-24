return {
    {
        "raddari/last-color.nvim",
        lazy = false,
    },
    {
        "aikow/base.nvim",
        opts = {},
        config = function()
            require('base').setup({})
            local theme = require('last-color').recall() or 'default'
            vim.cmd.colorscheme(theme)
            --vim.cmd.colorscheme('base-onedark')
        end
    }
}
