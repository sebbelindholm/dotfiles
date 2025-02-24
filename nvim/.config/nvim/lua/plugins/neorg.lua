return {
	"nvim-neorg/neorg",
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	dependencies = { "vhyrro/luarocks.nvim" },
	config = function()
		require("neorg").setup({
			load = {
				["core.concealer"] = {},
				["core.defaults"] = {},
			},
		})
	end,
}
