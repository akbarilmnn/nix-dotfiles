return {
    "laytan/cloak.nvim",
    config = function()
        require("cloak").setup({
            enabled = true,
            cloak_character = "*",
            highlight_group = "Comment",
            try_all_patterns = true,
            cloak_telescope = true,
            patterns = {
                {
                    file_pattern = ".env*",
                    cloak_pattern = "=.+",
                },
            },
        })
    end,
}
