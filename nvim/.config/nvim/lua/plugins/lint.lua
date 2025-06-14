return {
  {
    "mfussenegger/nvim-lint",
    enabled = false,
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("lint").linters_by_ft = {
        bash = { "shellcheck" },
        sh = { "shellcheck" },
        zsh = { "shellcheck" },
        c = { "cpplint" },
        lua = { "luacheck" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("Linting", { clear = true }),
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    enabled = false,
    config = function()
      require("mason-nvim-lint").setup({
        ensure_installed = {
          "shellcheck",
          "cpplint",
          "luacheck",
        },
      })
    end,
  },
}
