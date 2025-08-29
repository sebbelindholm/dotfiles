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
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },  --- Icons
	{ src = "https://github.com/ibhagwan/fzf-lua" },             --- Picker
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },      --- gitsigns
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },      --- Tree
	{ src = "https://github.com/Saghen/blink.cmp" },             --- Autocomplete
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/romgrk/fzy-lua-native" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/nvim-mini/mini.statusline" },
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

--- nvim-tree
require "nvim-tree".setup()

--- statusline
require('mini.statusline').setup()

--- auto_brackets
require("nvim-autopairs").setup({
	check_ts = true,
	enable_check_bracket_line = true,
})

--- indent blank line
require("ibl").setup()

--- LSP and autocomplete
local lspconfig = require("lspconfig")
local blink = require("blink.cmp")

blink.setup({
	keymap = { preset = "default" },
	completion = {
		accept = {
			auto_brackets = { enabled = true },
			auto_quotes = { enabled = true },
		},
		documentation = { auto_show = true },
	},
	sources = {
		default = { "lsp", "path", "buffer", "snippets" },
	},
	snippets = { preset = "default" },
	fuzzy = { implementation = "lua" },
})

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

local capabilities = blink.get_lsp_capabilities()

local servers = { "lua_ls" }

for _, server in ipairs(servers) do
	lspconfig[server].setup({
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			-- Autoformat on save
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end
			-- Optional: keymaps for navigation, code actions, etc.
		end,
	})
end

--- Clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

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
vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle nvim-tree", silent = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
