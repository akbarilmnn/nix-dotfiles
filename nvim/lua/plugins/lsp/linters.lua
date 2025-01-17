return {
    "mfussenegger/nvim-lint",
    init = function()
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                -- try lint's first argument is optional, but when is invoked like this.
                -- the cspell will always run for every linter for every file.
                require("lint").try_lint()
            end,
        })
    end,
    config = function()
        require("lint").linters.denolint = {
            cmd = "deno",
            args = { "lint" },
        }
        require("lint").linters_by_ft = {
            lua = { "selene" },
            javascript = { "oxlint" },
            typescript = { "oxlint" },
            c = { "cpplint" },
            cpp = { "cpplint" },
        }
    end,
}
