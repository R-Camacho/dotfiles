return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"j-hui/fidget.nvim",
		},
		config = function()
			local blink_cmp = require("blink.cmp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				blink_cmp.get_lsp_capabilities({}, false)
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

				map("n", "[d", function()
					vim.diagnostic.jump({ count = 1, float = true })
				end, "Previous diagnostic", bufnr)
				map("n", "]d", function()
					vim.diagnostic.jump({ count = -1, float = true })
				end, "Next diagnostic", bufnr)

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

	-- Completions
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {

			completion = {
				documentation = { window = { border = "single" }, auto_show = true },

				accept = {
					auto_brackets = {
						enabled = false,
					},
				},
			},

			signature = {
				enabled = true,
				trigger = { show_on_insert = true },

				window = {
					border = "rounded",

					-- Disable if performance issues.
					treesitter_highlighting = true,

					show_documentation = true,
				},
			},

			keymap = {

				preset = "default",

				["<CR>"] = { "select_and_accept", "fallback" },
				["<Tab>"] = { "select_and_accept", "fallback" },

				["<C-p>"] = { "select_prev", "fallback_to_mappings" },
				["<C-n>"] = { "select_next", "fallback_to_mappings" },
			},
		},
	},
}
