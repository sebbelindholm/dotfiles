return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim", "scottmckendry/telescope-resession.nvim" },

        config = function()
            require("telescope").setup({
                extensions = {
                    resession = {
                        prompt_title = "Find Sessions",
                        dir = "session",
                        path_substitutions = {
                            { find = "/home/sebastian/", replace = "󱂵" },
                        },
                    },
                }
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>rs", "<cmd>Telescope resession <CR>")
--            vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true <CR>")
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",

        config = function()
            require("telescope").setup({
                fzf = {
                    fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                },
                defaults = {
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--hidden',
                        '--smart-case',
                        '--glob "!.git"',
                    },
            },
            pickers = {
                    find_files = {
                        find_command = {"rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/.cargo/*", "--glob", "!**/.java/*", "--glob", "!**/.cache/*", "--glob", "!**/.rustup/*", "--glob", "!**/.npm/*", "--glob", "!**/go/*", "--glob", "!**/Steam/*"},
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("fzf")
        end,
    },
}
