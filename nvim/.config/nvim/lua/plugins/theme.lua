return {
	{
		"raddari/last-color.nvim",
		lazy = false,
	},
	{
		"aikow/base.nvim",
		lazy = false,
		opts = {},
		config = function()
			require("base").setup({})
			local theme = require("last-color").recall() or "default"
			vim.cmd.colorscheme(theme)
			vim.cmd("hi LineNr guibg=NONE")
			vim.cmd("hi FoldColumn guibg=NONE")
		end,
	},
}
