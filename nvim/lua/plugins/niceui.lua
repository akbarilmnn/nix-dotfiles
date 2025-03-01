return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        opts = {
            notifier = { enabled = true },
        },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
    },
    --{
    --    "rachartier/tiny-glimmer.nvim",
    --    event = "VeryLazy",
    --    opts = {
    --        default_animation = "pulse",
    --        overwrite = {
    --            paste = {
    --                default_animation = "left_to_right",
    --            },
    --        },
    --        animations = {
    --            fade = {
    --                from_color = "DiffDelete",
    --                to_color = "DiffAdd",
    --            },
    --            pulse = {
    --                from_color = "DiffDelete",
    --                to_color = "DiffAdd",
    --            },
    --            bounce = {
    --                from_color = "DiffDelete",
    --                to_color = "DiffAdd",
    --            },
    --            left_to_right = {
    --                from_color = "DiffDelete",
    --                to_color = "DiffAdd",
    --            },
    --        },
    --    },
    --},
    --{
    --    "sphamba/smear-cursor.nvim",
    --    opts = {
    --        stiffness = 0.8,
    --        trailing_stiffness = 0.5,
    --        distance_stop_animating = 0.5,
    --        hide_target_hack = false,
    --    },
    --},
    --{
    --    "karb94/neoscroll.nvim",
    --    opts = {},
    --},
}
