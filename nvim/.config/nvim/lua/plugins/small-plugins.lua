return {
	{
		"alec-gibson/nvim-tetris",
	},
	{
		"tamton-aquib/zone.nvim",
		config = function()
			require("zone").setup({
				style = "epilepsy",
				after = 120,
				exclude_filetypes = { "TelescopePrompt", "NvimTree", "neo-tree", "dashboard", "lazy" },
			})
		end,
	},
	{
		"tris203/precognition.nvim",
		opts = {},
		config = function()
			require("precognition").setup()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>pt",
				"<CMD>Precognition toggle<CR>",
				{ silent = true, desc = "Toggle navigation help" }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>pp",
				"<CMD>Precognition peek<CR>",
				{ silent = true, desc = "Turn off navigation help" }
			)
		end,
	},
	{
		"gvanishorbit99/codewindow.nvim",
		config = function()
			local codewindow = require("codewindow")
			codewindow.setup()
			codewindow.apply_default_keybinds()
		end,
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		keys = {
			{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
			{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
		},
		opts = {
			save_path = "~/Pictures",
			has_breadcrumbs = true,
			bg_theme = "grape",
		},
		config = function()
			require("codesnap").setup({})
		end,
	},
	{
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {
			context = 10,
			treesitter = true,
			expand = {
				"function",
				"method",
				"table",
				"if_statement",
			},
		},
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>tt",
				"<CMD>Twilight<CR>",
				{ silent = true, desc = "Toggle twilight mode" }
			)
		end,
	},
	{
		"filipdutescu/renamer.nvim",
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<leader>rn",
				'<cmd>lua require("renamer").rename()<cr>',
				{ noremap = true, silent = true, desc = "Rename" }
			)
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			text = {
				done = "",
			},
			window = {
				blend = 0,
			},
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			bind = true,
			handler_opts = {
				border = "single",
			},
		},
	},
	{
		"echasnovski/mini.icons",
		opts = {},
		lazy = true,
	},
	{
		"theRealCarneiro/hyprland-vim-syntax",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "hypr",
	},
	{
		"lambdalisue/suda.vim",
	},
	{
		"mvllow/modes.nvim",
		tag = "v0.2.0",
		config = function()
			require("modes").setup()
		end,
	},
	{
		"yorickpeterse/nvim-window",
		keys = {
			{ "<leader>w", "<cmd>lua require('nvim-window').pick()<cr>", desc = "Jump to window" },
		},
		config = true,
	},
	{
		"tris203/precognition.nvim",
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			filetypes = { "*", "!prompt", "!popup" },
			user_default_options = {
				RGB = true,
				RRGGBB = true,
				names = false,
				RRGGBBAA = true,
				AARRGGBB = false,
				rgb_fn = true,
				hsl_fn = true,
				css = false,
				css_fn = false,
				mode = "background",
				tailwind = true,
			},
			buftypes = {},
		},
	},
}
