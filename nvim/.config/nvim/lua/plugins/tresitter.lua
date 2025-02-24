return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	Lazy = false,
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},

	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			hightlight = {
				enable = true,
			},
			autoinstall = true,
			indent = { enable = true },
			autotag = {
				enable = true,
				enable_close_on_slash = false,
			},
			ensure_installed = "all",
		})
	end,
}
