return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim", "scottmckendry/telescope-resession.nvim" },

		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				defaults = {
					vimgrep_arguments = {
						"fg",
						--                        "--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						--                        "--hidden",
						--                        "--uuu"
					},
				},
				extensions = {
					resession = {
						prompt_title = "Find Sessions",
						dir = "session",
						path_substitutions = {
							{ find = "/home/sebastian", replace = " 󱂵 " },
						},
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					file_browser = {
						theme = "ivy",
						hidden = { file_browser = true, folder_browser = true },
						layout_config = { height = 0.4 },
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fh", builtin.oldfiles, {})
			vim.keymap.set("n", "<leader>rs", "<cmd>Telescope resession <CR>", { silent = true })
			vim.keymap.set("n", "<leader>ft", builtin.colorscheme, {})
			vim.keymap.set("n", "<leader><leader>", ":Telescope file_browser<CR>", { silent = true })
			vim.keymap.set("n", "<leader>fm", ":Telescope bookmarks list<CR>", { silent = true })
			vim.keymap.set("n", "<leader>fc", "<CMD>Telescope neoclip<CR>", { silent = true })
			vim.keymap.set("n", "<leader>fo", "<CMD>Telescope macroscope<CR>", { silent = true })
			--vim.keymap.set("n", "<leader>g", require("telescope").extensions.file_browser.file_browser(require("telescope.themes").get_ivy({layout_config = {height = 0.4}})), {})
			--            vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true <CR>")
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("bookmarks")
			require("telescope").load_extension("neoclip")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"tomasky/bookmarks.nvim",
		event = "VimEnter",
		config = function()
			require("bookmarks").setup({
				-- sign_priority = 8,  --set bookmark sign priority to cover other sign
				save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
				keywords = {
					["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
					["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
					["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
					["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
				},
				on_attach = function(bufnr)
					local bm = require("bookmarks")
					local map = vim.keymap.set
					map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
					map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
					map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
					map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
					map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
					map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
					map("n", "mx", bm.bookmark_clear_all) -- removes all bookmarks
				end,
			})
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = { "kkharji/sqlite.lua", module = "sqlite" },
		config = function()
			require("neoclip").setup({
				history = 1000,
				enable_persistent_history = true,
				continuous_sync = true,
				enable_macro_history = true,
			})
		end,
	},
}
