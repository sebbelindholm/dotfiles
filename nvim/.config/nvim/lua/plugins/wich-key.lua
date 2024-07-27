return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			icons = {
				breadcrumb = "󰫍 ",
				separator = " ",
				group = "+ ",
			},
			replace = {
				["<space>"] = "SPACE",
				["<leader>"] = "SPACE",
				["<cr>"] = "RETURN",
				["<tab>"] = "TAB",
			},
		})
	end,
}
