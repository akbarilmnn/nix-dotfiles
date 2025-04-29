return {
    "mfussenegger/nvim-lint",
    event = "BufWritePost",
    config = function()
        require("lint").linters_by_ft = {
            lua = { "selene" },
            javascript = { "oxlint" },
            typescript = { "oxlint" },
            c = { "cpplint" },
            cpp = { "cpplint" },
        }
    end,
}
