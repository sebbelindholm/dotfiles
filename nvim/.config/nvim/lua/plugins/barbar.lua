return {
	"romgrk/barbar.nvim",
	enabled = false,
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	config = function()
		require("barbar").setup({
			sidebar_filetypes = {
				["neo-tree"] = { event = "BufWipeout" },
				Outline = { event = "BufWinLeave", text = "symbols-outline", align = "right" },
			},
		})
	end,
}
