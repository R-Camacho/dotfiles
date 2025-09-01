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

			local map = function(mode, lhs, rhs, desc, bufnr)
				vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
			end

			local on_attach = function(_, bufnr)
				map("n", "<leader>lca", vim.lsp.buf.code_action, "Show code actions", bufnr)
				map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol", bufnr)
				map("n", "gd", vim.lsp.buf.definition, "Goto definition", bufnr)
				map("n", "gi", vim.lsp.buf.implementation, "Goto implementation", bufnr)
				map("n", "gr", vim.lsp.buf.references, "Goto references", bufnr)
				map("n", "K", vim.lsp.buf.hover, "Hover information", bufnr)
				map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbols", bufnr)
				map("n", "<leader>d", vim.diagnostic.open_float, "Show diagnostics", bufnr)
				map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic", bufnr)
				map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic", bufnr)
				map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help", bufnr)
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
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			{
				"ray-x/lsp_signature.nvim",
				lazy = true,
				event = "InsertEnter",
				opts = {},
			},
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local cmp_select = { behaviour = cmp.SelectBehavior.Select }

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select), -- or just use arrow keys
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "copilot", group_index = 2 },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
			})

			cmp.setup.filetype({ "codecompanion" }, {
				sources = {
					{ name = "codecompanion" },
				},
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
