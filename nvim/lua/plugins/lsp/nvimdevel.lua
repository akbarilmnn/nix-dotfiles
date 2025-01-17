return {
    "folke/lazydev.nvim",
    ft = "lua",
    dependencies = {
        -- wezterm's typedefs completion.
        "justinsgithub/wezterm-types",
    },
    opts = {
        library = {
            { path = "wezterm-types", mods = { "wezterm" } },
        },
    },
}
