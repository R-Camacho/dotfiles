return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},
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
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		opts = { render_modes = { "n", "c", "t" } },
	},
    {
        "uga-rosa/ccc.nvim",
        opts = {},
    }
}
