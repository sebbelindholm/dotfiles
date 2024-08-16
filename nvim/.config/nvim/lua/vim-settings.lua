vim.g.mapleader = " "
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "number"
vim.o.termguicolors = true
vim.o.laststatus = 3
vim.o.sessionoptions = "curdir,folds,globals,tabpages,terminal,winsize"
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:|,foldclose:]]
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 10
vim.o.conceallevel = 2
vim.o.shiftwidth = 4

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", { silent = true, desc = "Split vertical" })
vim.keymap.set("n", "<leader>vs", ":split<CR>", { silent = true, desc = "Split horizontal" })
vim.keymap.set("c", "<tab>", "<C-z>", { silent = false })
vim.keymap.set("n", "<C-Tab>", "<C-w><C-w>", {})
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<leader>db", ":bdelete<CR>", { silent = true, desc = "Delete buffer" })
vim.keymap.set("n", "<leader>dw", "<C-w>c", { desc = "Delete window (keep buffer)" })

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

function _G.set_terminal_keymap()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymap()")
