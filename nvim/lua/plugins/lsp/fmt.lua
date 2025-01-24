return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                -- define custom formatters.
                formatters = {
                    zigfmt = {
                        command = "zig",
                        args = { "fmt", "--color", "on" },
                    },
                    denofmt = {
                        command = "deno",
                        args = { "fmt" },
                    },
                },
                lua = { "stylua" },
                -- javascript = { "prettierd", "prettier", "denofmt", stop_at_first = true },
                javascript = { "denofmt" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                zig = { "zigfmt" },
            },
            format_on_save = {
                timeout_ms = 450,
                lsp_format = "fallback",
            },
        })
    end,
}
