return {
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,
	init = function()
		vim.g.moonflyItalics = false
	end,
	config = function()
		local color = require("moonfly").palette
		local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "moonfly",
			callback = function()
				vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = color.bg })
				vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = color.cranberry })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = color.sky })
				vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = color.yellow })
				vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = color.bg })
				vim.api.nvim_set_hl(0, "MiniFilesNormal", { fg = color.bg })
				vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = color.red })
				vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = color.yellow })
				vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = color.sky })
				vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = color.blue })
				vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { fg = color.emerald })
			end,
			group = custom_highlight,
		})

		vim.cmd([[colorscheme moonfly]])
	end,
}
