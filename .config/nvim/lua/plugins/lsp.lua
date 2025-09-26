return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"j-hui/fidget.nvim",
		},
		config = function()
			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_enable = true,
			})

			local blink_cmp = require("blink.cmp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				blink_cmp.get_lsp_capabilities({}, false)
			)

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local bufnr = ev.buf
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if not client then
						return
					end
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
					end

					map("n", "<leader>lca", vim.lsp.buf.code_action, "Show code actions")
					map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
					map("n", "gd", vim.lsp.buf.definition, "Goto definition")
					map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
					map("n", "gr", vim.lsp.buf.references, "Goto references")
					map("n", "K", vim.lsp.buf.hover, "Hover information")
					map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbols")
					map("n", "<leader>d", vim.diagnostic.open_float, "Show diagnostics")

                    -- stylua: ignore start
					map("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Previous diagnostic")
					map("n", "]d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Next diagnostic")
					-- stylua: ignore end

					map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
				end,
			})

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Add custom handlers here
			vim.lsp.config("clangd", {
				cmd = { "clangd", "--background-index" },
				filetypes = { "c", "cpp", "objc", "objcpp" },
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
