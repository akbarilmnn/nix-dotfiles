return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
        require("catppuccin").setup({
            flavour = "auto",
        })

        vim.cmd [[colorscheme catppuccin-mocha]]
    end
}
