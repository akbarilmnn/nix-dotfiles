return {
	"navarasu/onedark.nvim",
	dependencies = {
		"EdenEast/nightfox.nvim",
	},
	config = function()
		require("onedark").setup({
			style = "darker",
			highlights = {
				["@string"] = { fg = "#c89191" },
				["@lsp.type.comment"] = { fg = "#639955" },
				["@lsp.type.variable"] = { fg = "#ceceb2" },
				-- thanks to @tjdevries
				["WinSeparator"] = { bg = "None" },
			},
		})
		require("onedark").load()
	end,
}
