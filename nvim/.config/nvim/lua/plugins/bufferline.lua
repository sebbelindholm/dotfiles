return {
    'akinsho/bufferline.nvim',
    enabled = false,
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup{
            options = {
                offsets = {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    highlight = "Directory",
                    separator = true

                },
                separator_style = "thick",
            }
        }
    end
}
