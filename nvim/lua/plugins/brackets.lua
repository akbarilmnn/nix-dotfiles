return {
	"m4xshen/autoclose.nvim",
	config = function()
		require("autoclose").setup({
			keys = {
				-- cs as in c#
				["<"] = { escape = false, close = true, pair = "<>", enabled_filetypes = { "rust", "cpp", "java", "typescript", "cs"} }
			},
		})
	end
}
