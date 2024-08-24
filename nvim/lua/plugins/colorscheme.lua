return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            flavour = "auto",
            transparent_background = true,
        })

        vim.cmd [[colorscheme catppuccin-mocha]]
    end
}
