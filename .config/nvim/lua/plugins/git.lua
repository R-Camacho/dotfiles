return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {}, -- adds git decorations
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		cmd = { "Neogit" },
	},
}
