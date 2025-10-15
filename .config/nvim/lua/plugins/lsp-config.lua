return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
					"pyright",
					"prismals",
					"tailwindcss",
					"jdtls",
					"clangd",
					"gopls",
					"sqls",
					"phpactor",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
                        vim.lsp.config['lua_ls'] = {
				capabilities = capabilities,
                        } 
			vim.lsp.config['ts_ls'] = {
				capabilities = capabilities,
			}
			vim.lsp.config['html'] = {
				capabilities = capabilities,
			}
			vim.lsp.config['cssls'] = {
				capabilities = capabilities,
			}
			vim.lsp.config['pyright'] = {
				capabilities = capabilities,
			}
			vim.lsp.config['prismals'] = {
				capabilities = capabilities,
			}
			vim.lsp.config['tailwindcss'] = {
				capabilities = capabilities,
			}
			vim.lsp.config['jdtls'] = {
				capabilities = capabilities,
			}
			vim.lsp.config['clangd'] = {
				capabilities = capabilities,
			}
			vim.lsp.config['gopls'] = {
				capabilities = capabilities,
			}
			vim.lsp.config['sqls'] = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					client.server_capabilities.documentFormattingProvider = false
				end,
			}
			vim.lsp.config['phpactor'] = {
				capabilities = capabilities,
			}

			vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>da", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
