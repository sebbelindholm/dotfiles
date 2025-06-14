return {
  {
    "tris203/precognition.nvim",
    config = function()
      require("precognition").setup({ startVisible = false })
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
        { silent = true, desc = "Peek at navigation help" }
      )
    end,
  },
  {
    "gorbit99/codewindow.nvim",
    config = function()
      local codewindow = require("codewindow")
      codewindow.setup()
      codewindow.apply_default_keybinds()
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
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  },
  {
    "vigoux/notifier.nvim",
    config = function()
      require("notifier").setup({})
    end,
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
