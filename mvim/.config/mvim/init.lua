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
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.scrolloff = 10
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

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
	{ src = "https://github.com/windwp/nvim-autopairs" },                    --- Auto brackets
	{ src = "https://github.com/nvim-mini/mini.statusline" },                --- statusline
	{ src = "https://github.com/kevinhwang91/nvim-ufo" },                    --- folding
	{ src = "https://github.com/kevinhwang91/promise-async" },
	{ src = "https://github.com/kylechui/nvim-surround" },                   --- surround
	{ src = "https://github.com/olimorris/codecompanion.nvim" },             --- AI
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, --- markdown
	{ src = "https://github.com/echasnovski/mini.diff" },                    --- git diff
	{ src = "https://github.com/AbdelrahmanDwedar/awesome-nvim-colorschemes" }, --- color themes
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },             --- typst preview
	{ src = "https://github.com/akinsho/toggleterm.nvim" },                  --- terminal
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
	{ src = "https://github.com/rmagatti/auto-session" },                    --- auto sessions
	{ src = "https://github.com/OXY2DEV/helpview.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },                        --- snacks
	{ src = "https://github.com/christoomey/vim-tmux-navigator.git" },
})

--- snacks
require("snacks").setup({
	input = { enabled = true },
	scope = { enabled = true },
	quickfile = { enabled = true },
	notifier = { enabled = true },
	picker = {
		enabled = true,
		hidden = true,
	},
	scroll = { enabled = true },
	indent = { enalbed = true },
	statuscolumn = { enabled = true },
})

--- theme
require "catppuccin".setup({
	flavour = "macchiato",
	transparent_background = true,
	integrations = {
		telescope = true
	}
})
vim.cmd("colorscheme catppuccin")

--- Treesitter
require "nvim-treesitter.configs".setup({
	ensure_installed = { "lua", "typescript", "javascript", "vim", "python", "json", "yaml", "typst", "vimdoc" },
	highlight = { enable = true }
})

--- toggle term
require("toggleterm").setup({
	open_mapping = [[<c-t>]],
	autochdir = true,
	direction = "float",
})

require("auto-session").setup()

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

--- markdown
require "render-markdown".setup({
	file_types = { "markdown", "codecompanion" },
	completions = { lsp = { enabled = true } },
})

--- git diff
require "mini.diff".setup({
	source = require("mini.diff").gen_source.none(),
})

--- inline diagnostic fix
require('tiny-inline-diagnostic').setup()

--- surround
require("nvim-surround").setup()

--- nvim-tree
require "nvim-tree".setup()

--- statusline
require('mini.statusline').setup()

--- typst preview
require("typst-preview").setup({
	port = 5555
})

--- auto_brackets
require("nvim-autopairs").setup({
	check_ts = true,
	enable_check_bracket_line = true,
})

--- UFO folding
require('ufo').setup({
	provider_selector = function(bufnr, filetype, buftype)
		return { 'treesitter', 'indent' }
	end
})

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
		default = { "lsp", "path", "buffer", "snippets", "codecompanion" },
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

local servers = { "lua_ls", "ts_ls", "pyright", "tinymist" }

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

--- AI
require("codecompanion").setup({
	adapter = "ollama",
	strategies = {
		chat = {
			adapter = "ollama",
		},
		inline = {
			adapter = "ollama",
		},
		cmf = {
			adapter = "ollama",
		},
	},
	ollama = function()
		return require("codecompanion.adapters").extend("ollama", {
			schema = {
				model = {
					default = "codellama:13b"
				},
			},
		})
	end,

	chat = {
		render = "markdown",
	},
})

--- Clipboard
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

--- Keybinds
local map = vim.keymap.set
local snacks = require("snacks")

map('n', '<leader>lb', vim.lsp.buf.format)
map('n', '<leader>rn', vim.lsp.buf.rename)
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader>vv", ":vsplit<CR>", { silent = true, desc = "Split vertical" })
map("n", "<leader>vs", ":split<CR>", { silent = true, desc = "Split horizontal" })
map("c", "<tab>", "<C-z>", { silent = false })
map("n", "<C-Tab>", "<C-w><C-w>", {})
map("n", "<C-v>", '"+p')
map("v", "<C-c>", '"+y')
map("n", "<leader>db", ":bdelete<CR>", { silent = true, desc = "Delete buffer" })
map("n", "<leader>dw", "<C-w>c", { desc = "Delete window (keep buffer)" })
map("n", "<C-h>", "<C-W>h")
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-l>", "<C-W>l")
map("n", "<leader>n", function() snacks.explorer() end, { desc = "Toggle Explorer", silent = true })
map("n", "<leader>ff", function() snacks.picker.smart() end, { desc = "Find files", silent = true })
map("n", "<leader>fb", function() snacks.picker.buffers() end, { desc = "Find buffers", silent = true })
map("n", "<leader>fg", function() snacks.picker.grep() end, { desc = "Grep", silent = true })
map("n", "<leader>fn", function() snacks.picker.notifications() end, { desc = "Notifications history", silent = true })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map('n', '<leader>ua', require('ufo').openAllFolds, { desc = "Open all folds" })
map('n', '<leader>uc', require('ufo').closeAllFolds, { desc = "Close all folds" })
map('n', '<leader>fo', "<cmd>foldopen<cr>", { desc = "Open fold", silent = true })
map('n', '<leader>fc', "<cmd>foldclose<cr>", { desc = "Close fold", silent = true })
map('n', '<leader>cc', "<cmd>CodeCompanionChat toggle<cr>", { desc = "Toggle AI chat window", silent = true })
map('n', '<leader>ss', "<cmd>AutoSession save<cr>", { desc = "Save current session", silent = true })
map('n', '<leader>sf', "<cmd>AutoSession search<cr>", { desc = "Search for session", silent = true })
map('n', '<leader>st', "<cmd>AutoSession toggle<cr>", { desc = "Toggle auto session", silent = true })
