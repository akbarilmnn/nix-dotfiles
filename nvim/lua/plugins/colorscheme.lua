return {
    {
        "navarasu/onedark.nvim",
        opts = {
            style = "darker",
            highlights = {
                ["@string"] = { fg = "#c89191" },
                ["@lsp.type.comment"] = { fg = "#639955" },
                ["@lsp.type.variable"] = { fg = "#ceceb2" },
                -- thanks to @tjdevries
                ["WinSeparator"] = { bg = "None" },
            },
        },
        config = function()
            -- how to initialize onedark
            -- require("onedark").load()
            vim.cmd([[colorscheme kanagawa]])
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        -- Default options:
        opts = {
            compile = false, -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = { italic = true },
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = { bold = true },
            transparent = false, -- do not set background color
            dimInactive = false, -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = {    -- add/modify theme and palette colors
                palette = {},
                theme = {
                    wave = {},
                    lotus = {},
                    dragon = {},
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
            overrides = function(colors) -- add/modify highlights
                local theme = colors.theme
                return {
                    -- telescope windows overrides.
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = "None" },
                    TelescopeResultsBorder = { fg = theme.ui.bg_p1, bg = "None" },
                    -- treesitter highlights overrides.
                    ["@type"] = {
                        -- fg = "#fcd86d"
                        fg = "#71c9bd",
                    },
                    ["@function"] = { fg = "#fcca69" },
                    ["WinSeparator"] = { fg = "None" },
                    ["@variable"] = { fg = "#edddad" },
                    ["@variable.parameter"] = {
                        -- fg = "#af9ed3"
                        fg = "#f6b363",
                    },
                    ["@property"] = { fg = "#ee5a98" },
                    ["@keyword"] = {
                        -- fg = "#d568d3"
                        fg = "#639acb",
                    },
                    ["Normal"] = { bg = "#141414" },
                    ["@operator"] = { fg = "#7fbddc" },
                    ["@module"] = { fg = "#97c36c" },
                    ["@string"] = {
                        -- fg = "#c89191"
                        fg = "#cb9292",
                    },
                }
            end,
            theme = "wave", -- Load "wave" theme when 'background' option is not set
            background = { -- map the value of 'background' option to a theme
                dark = "wave", -- try "dragon" !
                light = "lotus",
            },
        },
    },
    {
        "folke/tokyonight.nvim",
        opts = {
            style = "night",
            styles = {
                keywords = {
                    italic = false,
                },
            },
            on_highlights = function(hl, _)
                hl["@type"] = {
                    fg = "#fcd86d",
                }
                hl["@property"] = {
                    -- fg = "#eb726b",
                    fg = "#ee5a98",
                }
                hl["@string"] = {
                    -- fg = "#ce8349",
                    fg = "#ffad82",
                }
                hl["@comment"] = {
                    fg = "#639955",
                }
                hl["@variable.parameter"] = {
                    -- fg = "#d29bc6",
                    -- fg = "#ff8934",
                    -- fg = "#ffb82d",
                    fg = "#fddd80",
                }
                hl["@variable"] = {
                    -- fg = "#64ffdf",
                    fg = "#ceceb2",
                }
                hl["@function"] = {
                    --fg = "#fddd80",
                    -- fg = "#5efd8d",
                    -- fg = "#ceceb2",
                    fg = "#fdec56",
                }
                hl["@function.builtin"] = {
                    fg = "#5efd8e",
                }
                hl["@module"] = {
                    fg = "#8ad5c7",
                }
                hl["@keyword"] = {
                    fg = "#d568d3",
                }
                hl["WinSeparator"] = {
                    fg = "None",
                }
                hl["Normal"] = {
                    bg = "#16161e",
                }
                hl["@operator"] = {
                    fg = "#a9b1d6",
                }
                hl["@punctuation.delimiter"] = {
                    fg = "#a9b1d6",
                }
            end,
        },
    },
}
