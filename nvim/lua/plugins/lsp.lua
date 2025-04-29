return {
	-- Main plugins to configure each LSP server.
	"neovim/nvim-lspconfig",
	init = function()
		local bufopts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
		-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)

		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, bufopts)

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰧞 ",
					[vim.diagnostic.severity.WARN] = "󰧞 ",
					[vim.diagnostic.severity.HINT] = "󰧞 ",
					[vim.diagnostic.severity.INFO] = "󰧞 ",
				},
			},
			virtual_text = true,
		})
	end,
	dependencies = {
		-- Integration for completion
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		-- Installer for LSP servers, formatters and linters.
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					border = "rounded",
					icons = {
						package_installed = "󰏗",
						package_pending = "󰏔",
						package_uninstalled = "󱧖",
					},
				},
			},
		},
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				local ensure_installed = {
					-- lua setup
					"lua_ls",
					-- python setup
					"pyright",
					"ruff",
					-- javascript/typescript setup
					"denols",
					-- zig
					"zls",
					-- C family
					"clangd",
					-- Java
					"java_language_server",
				}
				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				local handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
							on_attach = function(client, bufnr)
								on_attach(client, bufnr)
							end,
						})
					end,
					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim" },
									},
								},
							},
						})
					end,
				}
				require("mason-lspconfig").setup({
					ensure_installed = ensure_installed,
					handlers = handlers,
				})
			end,
		},
	},
}
