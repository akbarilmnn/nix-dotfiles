return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    cond = function()
        local check_deps = require("utils").check_deps_with_fallback
        return check_deps({ { "latex2text" } })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {},
}
