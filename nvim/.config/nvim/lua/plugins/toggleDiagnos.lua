return {
	"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",

	config = function()
		require("toggle_lsp_diagnostics").init()
		vim.keymap.set("n", "<leader>di", "<CMD>:ToggleDiag<CR>", { silent = true, desc = "Toggle all diagnostics" })
	end,
}
