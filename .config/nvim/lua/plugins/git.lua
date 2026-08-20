return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {}, -- adds git decorations
	},
	{
		"NeogitOrg/neogit",
        lazy = true,
		dependencies = {
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		cmd = { "Neogit" },
	},
}
