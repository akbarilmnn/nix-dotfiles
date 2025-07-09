vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight when copying text",
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
