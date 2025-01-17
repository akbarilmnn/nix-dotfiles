return {

    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    cond = function()
        local deps = { { "curl", "git" } }
        return require("utils").check_deps_with_fallback(deps)
    end,
    -- use a release tag to download pre-built binaries
    version = "v0.*",
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "default",
            ["<Tab>"] = {
                "select_next",
                "fallback",
            },
            ["<CR>"] = {
                "accept",
                "fallback",
            },
        },
        completion = {
            list = {
                max_items = 15,
                selection = {
                    preselect = true,
                },
            },
            menu = {
                border = "rounded",
                scrollbar = false,
                draw = {
                    columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                },
            },
            documentation = {
                window = {
                    border = "rounded",
                },
            },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
            kind_icons = {
                Text = "",
                Method = "",
                Function = "󰊕",
                Constructor = "󰒓",

                Field = "",
                Variable = "",
                Property = "󰖷",

                Class = "",
                Interface = "",
                Struct = "",
                Module = "",

                Unit = "",
                Value = "󰦨",
                Enum = "",
                EnumMember = "",

                Keyword = "",
                Constant = "󰏿",

                Snippet = "󰲌",
                Color = "󰏘",
                File = "",
                Reference = "",
                Folder = "",
                Event = "",
                Operator = "",
                TypeParameter = "",
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        signature = {
            enabled = true,
            window = {
                border = "rounded",
            },
        },
    },
    opts_extend = { "sources.default" },
}
