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
    {
        "sphamba/smear-cursor.nvim",
        opts = {
            stiffness = 0.8,
            trailing_stiffness = 0.5,
            distance_stop_animating = 0.5,
            hide_target_hack = false,
        },
    },
    {
        "karb94/neoscroll.nvim",
        opts = {},
    },
}
