return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"rebelot/kanagawa.nvim",
	},
	config = function()
		local colors = require("kanagawa.colors").setup()
		local theme = colors.theme
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 3)
						end,
						color = { fg = theme.ui.fg, bg = theme.ui.bg },
					},
				},
				lualine_b = {
					{
						"lsp_status",
						icon = "󰅩",
						color = { fg = theme.ui.fg, bg = theme.ui.bg },
					},
				},
				lualine_c = {
					{
						"filetype",
						color = { fg = theme.ui.fg, bg = theme.ui.bg },
						icon_only = true,
						icon = { align = "right" },
					},
					{
						"filename",
						path = 3,
						color = { fg = theme.ui.fg, bg = theme.ui.bg },
					},
				},
				lualine_x = {
					{
						"diagnostics",
						always_visible = true,
						color = { fg = theme.ui.fg, bg = theme.ui.bg },
					},
					{
						"filetype",
						icon_only = true,
						icon = { align = "left" },
						color = { fg = theme.ui.fg, bg = theme.ui.bg },
					},
				},
				lualine_y = { "os.date('%a')", "data", "require'lsp-status'.status()" },
				lualine_z = {
					{
						"location",
						color = { fg = theme.ui.fg, bg = theme.ui.bg },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
