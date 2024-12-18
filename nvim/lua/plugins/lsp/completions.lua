return {
    -- neovim completion engine
    "hrsh7th/nvim-cmp",
    event = {
        "InsertEnter",
    },
    dependencies = {
        -- sources for the completion engines.
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        -- snippet engines.
        -- "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        -- vscode like pictograms.
        "onsails/lspkind.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        -- limits LSP results menu
        vim.opt.pumheight = 13

        cmp.setup({
            expand = function(args)
                --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
            end,
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            experimental = {
                -- ghost_text = true,
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
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                -- { name = 'vsnip' }, -- For vsnip users.
                { name = "luasnip" }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
                { name = "buffer" },
                { name = "path" },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol", -- show only symbol annotations
                    maxwidth = {
                        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        -- can also be a function to dynamically calculate max width such as
                        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                        menu = 50, -- leading text (labelDetails)
                        abbr = 50, -- actual suggestion item
                    },
                    menu = {
                        buffer = "[BUF]",
                        nvim_lsp = "[LSP]",
                        path = "[PATH]",
                        luasnip = "[snip]",
                    },
                    ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                    show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                    -- The function below will be called before any actual modifications from lspkind
                    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                    -- `_` was called `entry`
                    before = function(_, vim_item)
                        -- in order to not show the function definition after [LSP]` string
                        vim_item.menu = nil
                        return vim_item
                    end,
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
        })
    end,
}
