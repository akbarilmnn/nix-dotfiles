vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when copying text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "additional LSP keybindings",
	group = vim.api.nvim_create_augroup("lsp-more-keybindings", { clear = true }),
	callback = function()
		local bufopts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
	end,
})
