-- add more keymaps when attached to an LSP server.
local function lsp_keymaps_setup()
    local lsp_keymap = function(keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { desc = desc })
    end

    -- mappings for diagnostics
    lsp_keymap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    lsp_keymap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    lsp_keymap("gd", vim.lsp.buf.definition, "[G]oto [D]definition")
    lsp_keymap("gr", "<cmd>Telescope lsp_references<cr>", "[G]oto [R]eferences")
    lsp_keymap("gi", vim.lsp.buf.implementation, "[g]oto [i]mplementation")
    lsp_keymap("gt", vim.lsp.buf.type_definition, "type [d]definition")

    lsp_keymap("K", vim.lsp.buf.hover, "Hover Documentation")
end

-- autocmmand for highlight a block of text on yank
--vim.api.nvim_create_autocmd("TextYankPost", {
--	desc = "Highlight after yank",
--	group = vim.api.nvim_create_augroup("utils", { clear = true }),
--	callback = function()
--		vim.highlight.on_yank()
--	end,
--})

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP keymaps and enabling format-on-save.",
    group = vim.api.nvim_create_augroup("lsp-utils", { clear = true }),
    callback = function(args)
        lsp_keymaps_setup()
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
            return
        end

        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                end,
            })
        end
    end,
})
