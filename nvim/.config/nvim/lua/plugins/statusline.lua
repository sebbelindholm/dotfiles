return {
	"echasnovski/mini.statusline",
	version = false,
	dependencies = {
		"echasnovski/mini-git",
		main = "mini.git",
		"echasnovski/mini.diff",
	},
	config = function()
		require("mini.statusline").setup()
	end,
}
