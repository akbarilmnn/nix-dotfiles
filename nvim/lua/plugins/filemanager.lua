return {
    "stevearc/oil.nvim",
    -- had to comment this out in order to use `Oil` when opening a directory from cmd using neovim.
    -- cmd = "Oil",
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil",
            callback = function()
                vim.opt_local.colorcolumn = ""
            end,
        })
    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
        })
    end,
}
