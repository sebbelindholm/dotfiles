return {
    {
        "theRealCarneiro/hyprland-vim-syntax",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "hypr",
    },
    {
        "lambdalisue/suda.vim",
    },
    {
	    'mvllow/modes.nvim',
        tag = 'v0.2.0',
        config = function()
            require('modes').setup()
        end
    },
    {
        "yorickpeterse/nvim-window",
            keys = {
                { "<leader>w", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
            },
        config = true,
    },
    {
        "tris203/precognition.nvim",
    }
}
