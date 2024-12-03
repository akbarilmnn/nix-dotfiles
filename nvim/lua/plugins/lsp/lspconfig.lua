return {
	"neovim/nvim-lspconfig",
	init = function()
		-- define custom diagnostics icons.
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })
	end,
	dependencies = {
		-- tool to install LSP, formatters, linters, and DAPs.
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		},
		-- installer for linters formatters and DAPs
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			config = function()
				require("mason-tool-installer").setup({
					ensure_installed = {
						"clang-format",
						"prettierd",
						"stylua",
						"oxlint",
					},
				})
			end,
		},
		-- tool to integrate mason.nvim and nvim-lspconfig.
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = {
						"lua_ls",
						"rust_analyzer",
						"zls",
						"clangd",
						"denols",
						-- NOTE: these requires nodejs
						"html",
						"cssls",
					},
				})
			end,
		},
		-- source for LSP completions.
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		local mason_lsp = require("mason-lspconfig")

		local on_attach = function() end

		local handlers = {
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
			["lua_ls"] = function()
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
		mason_lsp.setup_handlers(handlers)
	end,
}
