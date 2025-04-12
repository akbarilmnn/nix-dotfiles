return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"bluz71/vim-moonfly-colors",
	},
	config = function()
		local palette = require("moonfly").palette
		local fgbg = { fg = palette.white, bg = palette.grey23 }

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
						color = fgbg,
					},
				},
				lualine_b = {
					{
						"lsp_status",
						icon = "󰅩",
						color = fgbg,
					},
				},
				lualine_c = {
					{ "filetype", color = fgbg, icon_only = true, icon = { align = "right" } },
					{ "filename", path = 5, color = fgbg },
				},
				lualine_x = {
					{
						"diagnostics",
						color = fgbg,
						always_visible = true,
					},
					{
						"filetype",
						color = fgbg,
						icon_only = true,
						icon = { align = "left" },
					},
				},
				lualine_y = {
					{
						function()
							local prefix = require("os").date("%a")
							return prefix .. "day"
						end,
						color = fgbg,
					},
				},
				lualine_z = { { "location", color = fgbg } },
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
