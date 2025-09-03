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
	{ src = "https://github.com/windwp/nvim-autopairs" },                   --- Auto brackets
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },     --- Indent
	{ src = "https://github.com/nvim-mini/mini.statusline" },               --- statusline
	{ src = "https://github.com/kevinhwang91/nvim-ufo" },                   --- folding
	{ src = "https://github.com/kevinhwang91/promise-async" },
	{ src = "https://github.com/kylechui/nvim-surround" },                  --- surround
	{ src = "https://github.com/olimorris/codecompanion.nvim" },            --- AI
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, --- markdown
	{ src = "https://github.com/echasnovski/mini.diff" },                   --- git diff
	{ src = "https://github.com/AbdelrahmanDwedar/awesome-nvim-colorschemes" } --- color themes
})

--- Theme
---require "vague".setup({ transparent = true })
---vim.cmd("colorscheme vague")
---vim.cmd(":hi statusline guibg=NONE")
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
	ensure_installed = { "lua", "typescript", "javascript", "vim", "python", "json", "yaml" },
	highlight = { enable = true }
})

--- markdown
require "render-markdown".setup({
	file_types = { "markdown", "codecompanion" },
	completions = { lsp = { enabled = true } },
})

--- git diff
require "mini.diff".setup({
	source = require("mini.diff").gen_source.none(),
})

--- surround
require("nvim-surround").setup()

--- nvim-tree
require "nvim-tree".setup()

--- statusline
require('mini.statusline').setup()

--- auto_brackets
require("nvim-autopairs").setup({
	check_ts = true,
	enable_check_bracket_line = true,
})

--- indent-blankline
require("ibl").setup({
	scope = {
		enabled = true,
	},
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

local servers = { "lua_ls", "ts_ls", "pyright" }

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
vim.keymap.set('n', '<leader>ff', ":FzfLua files<CR>")
vim.keymap.set('n', '<leader>fb', ":FzfLua buffers<CR>")
vim.keymap.set('n', '<leader>fg', ":FzfLua live_grep_native<CR>")
vim.keymap.set('n', '<leader>/', ":FzfLua grep_curbuf<CR>")
vim.keymap.set('n', '<leader>lb', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
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
vim.keymap.set('n', '<leader>ua', require('ufo').openAllFolds, { desc = "Open all folds" })
vim.keymap.set('n', '<leader>uc', require('ufo').closeAllFolds, { desc = "Close all folds" })
vim.keymap.set('n', '<leader>fo', "<cmd>foldopen<cr>", { desc = "Open fold", silent = true })
vim.keymap.set('n', '<leader>fc', "<cmd>foldclose<cr>", { desc = "Close fold", silent = true })
vim.keymap.set('n', '<leader>cc', "<cmd>CodeCompanionChat toggle<cr>", { desc = "Toggle AI chat window", silent = true })
