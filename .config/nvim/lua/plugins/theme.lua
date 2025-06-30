return {
	-- THEMERY PLUGIN
	{
		"zaldih/themery.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("themery").setup({
				themes = {
					{
						name = "tokyonight",
						colorscheme = "tokyonight",
					},
					{
						name = "catppuccin",
						colorscheme = "catppuccin",
					},
					{
						name = "gruvbox",
						colorscheme = "gruvbox",
					},
					{
						name = "rose-pine",
						colorscheme = "rose-pine",
					},
					{
						name = "gruber-darker",
						colorscheme = "gruber-darker",
					},
					{
						name = "nightfox",
						colorscheme = "nightfox",
					},
					{
						name = "dayfox",
						colorscheme = "dayfox",
					},
					{
						name = "kanso-ink",
						colorscheme = "kanso-ink",
					},
					{
						name = "kanso-zen",
						colorscheme = "kanso-zen",
					},
				},
				-- themeConfigFile = "~/.config/nvim/lua/themery_theme.lua", -- Outdated
				livePreview = true,
			})
		end,
	},

	-- Themes
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = true,
		opts = { style = "moon", transparent = true },
		config = function(_, opts)
			require("tokyonight").setup(opts)
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		opts = { flavour = "mocha", transparent_background = true },
		config = function(_, opts)
			require("catppuccin").setup(opts)
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		lazy = true,
		opts = {},
		config = function(_, opts)
			require("gruvbox").setup(opts)
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		opts = { variant = "main", disable_background = true },
		config = function(_, opts)
			require("rose-pine").setup(opts)
		end,
	},
	{
		"blazkowolf/gruber-darker.nvim",
		name = "gruber-darker",
		opts = {
			italic = {
				strings = false,
				comments = false,
				operators = false,
				folds = false,
			},
		},
		config = function(_, opts)
			require("gruber-darker").setup(opts)
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		opts = {},
		config = function(_, opts)
			require("nightfox").setup(opts)
		end,
	},
	{
		"webhooked/kanso.nvim",
		name = "kanso",
		opts = {
            italics = false,
        },
		config = function(_, opts)
			require("kanso").setup(opts)
		end,
	},
}
