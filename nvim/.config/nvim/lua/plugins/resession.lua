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

		---vim.api.nvim_create_autocmd("VimLeavePre", {
		---	callback = function()
		---			resession.save("last")
		---	end,
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				-- Only load the session if nvim was started with no args and without reading from stdin
				if vim.fn.argc(-1) == 0 and not vim.g.using_stdin then
					-- Save these to a different directory, so our manual sessions don't get polluted
					resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
				end
			end,
			nested = true,
		})
		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
			end,
		})
		vim.api.nvim_create_autocmd("StdinReadPre", {
			callback = function()
				-- Store this for later
				vim.g.using_stdin = true
			end,
		})
	end,
}
