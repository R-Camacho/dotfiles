return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
		},
		config = function()
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)

			local on_attach = function(_, bufnr)
				vim.keymap.set(
					"n",
					"<leader>lca",
					vim.lsp.buf.code_action,
					{ desc = "Show code actions", buffer = bufnr }
				)
				vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = bufnr })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition", buffer = bufnr })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Goto implementation", buffer = bufnr })
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Goto references", buffer = bufnr })
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover information", buffer = bufnr })

				-- TODO: does not work
				vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", buffer = bufnr })
			end

			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" },
				automatic_installation = true,
			})

			vim.lsp.config("*", {
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Add custom handlers here
			vim.lsp.config("clangd", {
				cmd = { "clangd", "--background-index" },
				filetypes = { "c", "cpp", "objc", "objcpp" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},

	-- Code completions
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			{ "ray-x/lsp_signature.nvim", event = "InsertEnter", opts = {} },
		},
		config = function()
			local cmp = require("cmp")
			local cmp_select = { behaviour = cmp.SelectBehavior.Select }
			cmp.setup({

				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select), -- or just use arrow keys
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}),

				sources = cmp.config.sources({
					{ name = "copilot", group_index = 2 },
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),

				cmp.setup.filetype({ "codecompanion" }, {
					sources = {
						{ name = "codecompanion" },
					},
				}),
			})

			vim.diagnostic.config({
				virtual_text = {
					spacing = 4,
					prefix = "●",
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},
}
