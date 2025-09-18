vim.lsp.enable({
	"lua_ls",
	"clangd",
	"denols",
	"jdtls",
	"pyright",
	"ruff",
	"zls",
	"html",
	"tailwindcss",
	"rust_analyzer",
	"bacon_ls",
})

vim.diagnostic.config({
	-- the UI looks cool but it a bit hard to read.
	-- virtual_lines = true,
	--virtual_text = false,
	-- `virtual_text` is disabled because it is required by `tiny-inline-diagnostics.nvim``
	-- virtual_text = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰧞 ",
			[vim.diagnostic.severity.WARN] = "󰧞 ",
			[vim.diagnostic.severity.INFO] = "󰧞 ",
			[vim.diagnostic.severity.HINT] = "󰧞 ",
		},
	},
})
