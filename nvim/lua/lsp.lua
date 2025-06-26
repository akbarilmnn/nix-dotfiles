vim.lsp.enable("lua_ls")

vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = false,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "",
        }
    }
})
