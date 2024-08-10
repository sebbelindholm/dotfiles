return {
	"freddiehaddad/feline.nvim",
	enabled = false,
	opts = {},
	config = function(_, opts)
		vim.cmd("set relativenumber")
		require("feline").statuscolumn.setup() -- to use statuscolumn
	end,
}
