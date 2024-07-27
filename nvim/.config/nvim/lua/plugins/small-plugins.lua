return {
	{
		"echasnovski/mini.icons",
		opts = {},
		lazy = true,
	},
	{
		"theRealCarneiro/hyprland-vim-syntax",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "hypr",
	},
	{
		"lambdalisue/suda.vim",
	},
	{
		"mvllow/modes.nvim",
		tag = "v0.2.0",
		config = function()
			require("modes").setup()
		end,
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
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			filetypes = { "*", "!prompt", "!popup" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = true,
				AARRGGBB = false,
				rgb_fn = true,
				hsl_fn = true,
				css = false,
				css_fn = false,
				mode = "background",
				tailwind = true,
			},
			buftypes = {},
		},
	},
}
