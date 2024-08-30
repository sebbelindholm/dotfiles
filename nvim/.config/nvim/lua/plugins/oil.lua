return {
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
	},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },

	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory in oil" })
	end,
}
