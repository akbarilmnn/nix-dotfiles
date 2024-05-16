return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				-- you could pass some options.
				{ name = "nvim_lsp", option = {} },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = true,
			},
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 15,
					ellipsis_char = "...",
                    -- comment this out if you want to see the long definition of completion.
					menu = {
						buffer = "[BUF]",
						nvim_lsp = "[LSP]",
						path = "[PATH]",
						luasnip = "[snip]",
                        -- or you can set this to an empty string so that you don't see anything
                        -- except the symbol of lspkind
                        --buffer = "",
                        --nvim_lsp = "",
                        --path = "",
                        --luasnip = "",
					},
					-- comment this out to get the default ones from lspkind.
					-- trying to make the pictogram like vscode.
					symbol_map = {
						Field = "",
                        Property = "",
						TypeParameter = "",
						Struct = "",
						Interface = "",
						Constant = "",
						EnumMember = "",
						Enum = "",
						Keyword = "",
						Variable = "",
						Unit = "",
						Module = "",
						Class = "",
						Operator = "",
						File = "",
						Text = "",
					},
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
		})
	end,
}
