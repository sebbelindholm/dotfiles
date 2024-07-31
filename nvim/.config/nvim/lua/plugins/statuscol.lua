return {
	"luukvbaal/statuscol.nvim",
	config = function()
		require("statuscol").setup({
			ft_ignore = { "neo-tree" },
		})
	end,
}
