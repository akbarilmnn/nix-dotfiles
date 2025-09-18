return {
	"mason-org/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"bacon",
					"clang-format",
					"cpplint",
					"css-lsp",
					"deno",
					"ember-language-server",
					"gopls",
					"html-lsp",
					"jdtls",
					"oxlint",
					"pyright",
					"ruff",
					"rust-analyzer",
					"selene",
					"tailwindcss-language-server",
					"zls",
					"rustywind",
				},
			})
		end,
	},
	opts = {
		ui = {
			icons = {
				package_installed = "󰏗 ",
				package_pending = "󰏔 ",
				package_uninstalled = "󱧖 ",
			},
		},
	},
}
