return {
	"dgagn/diagflow.nvim",
	event = "LspAttach",
	config = function()
		require("diagflow").setup({
			placement = "inline",
			inline_padding_left = 3,
		})
	end,
}
