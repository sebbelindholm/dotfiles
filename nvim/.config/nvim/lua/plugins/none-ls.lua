return {
	"nvimtools/none-ls.nvim",
    enabled = false,
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format,
                null_ls.builtins.completion.luasnip,
                null_ls.builtins.completion.tags,
                null_ls.builtins.diagnostics.checkmake,
                null_ls.builtins.diagnostics.cmake_lint,
                null_ls.builtins.diagnostics.djlint,
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.diagnostics.stylint,
                null_ls.builtins.formatting.uncrustify,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
