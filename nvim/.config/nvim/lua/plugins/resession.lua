return {
	"stevearc/resession.nvim",
	config = function()
		local resession = require("resession")
		resession.setup({
			autosave = {
				enabled = true,
				inteval = 60,
				notify = true,
			},
		})
		vim.keymap.set("n", "<leader>ss", resession.save, { desc = "Session save" })
		vim.keymap.set("n", "<leader>sl", resession.load, { desc = "Session load" })
		vim.keymap.set("n", "<leader>sd", resession.delete, { desc = "Session delete" })

		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				resession.save("last")
			end,
		})
	end,
}
