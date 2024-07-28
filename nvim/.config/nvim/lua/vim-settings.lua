vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set laststatus=3")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.cmd("set termguicolors")
vim.opt.laststatus = 3
vim.opt.showtabline = 0
vim.opt.fillchars = { eob = " " }

--vim.cmd("colorscheme base-onedark")

vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>vs", ":split<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", ":bn<cr>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bp<cr>", { silent = true })
vim.keymap.set("n", "<C-Tab>", "<C-w><C-w>", {})
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<leader>db", ":bdelete<CR>", { silent = true })

vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")

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
