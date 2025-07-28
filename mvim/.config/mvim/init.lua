--- General Settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
vim.o.laststatus = 3
vim.o.sessionoptions = "curdir,folds,globals,tabpages,terminal,winsize"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:|,foldclose:]]
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.scrolloff = 10
vim.o.shiftwidth = 4

--- Packages
vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },           --- Theme
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }, --- Treesitter
	{ src = "https://github.com/neovim/nvim-lspconfig" },        --- lsp-config
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" }, --- Icons
	{ src = "https://github.com/ibhagwan/fzf-lua" }, --- Picker
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }, --- gitsigns
})

--- Theme
require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")

--- Treesitter
require "nvim-treesitter.configs".setup({
	ensure_installed = { "lua", "typescript", "javascript", "vim" },
	highlight = { enable = true }
})

--- LSP
vim.lsp.enable({ "luals" })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

--- Keybinds
vim.keymap.set('n', '<leader>ff', ":FzfLua files<CR>")
vim.keymap.set('n', '<leader>fb', ":FzfLua buffers<CR>")
vim.keymap.set('n', '<leader>fg', ":FzfLua live_grep_native<CR>")
vim.keymap.set('n', '<leader>/', ":FzfLua grep_curbuf<CR>")
vim.keymap.set('n', '<leader>lb', vim.lsp.buf.format)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", { silent = true, desc = "Split vertical" })
vim.keymap.set("n", "<leader>vs", ":split<CR>", { silent = true, desc = "Split horizontal" })
vim.keymap.set("c", "<tab>", "<C-z>", { silent = false })
vim.keymap.set("n", "<C-Tab>", "<C-w><C-w>", {})
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<leader>db", ":bdelete<CR>", { silent = true, desc = "Delete buffer" })
vim.keymap.set("n", "<leader>dw", "<C-w>c", { desc = "Delete window (keep buffer)" })
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")
