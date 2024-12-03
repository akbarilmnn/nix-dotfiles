-- autocmmand for highlight a block of text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight after yank",
	group = vim.api.nvim_create_augroup("utils", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "extra keybindings when attached to an LSP.",
	group = vim.api.nvim_create_augroup("utils", { clear = true }),
	callback = function()
		local lsp_keymap = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end

			vim.keymap.set("n", keys, func, { desc = desc })
		end

		-- mappings for diagnostics
		lsp_keymap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		lsp_keymap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

		lsp_keymap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		lsp_keymap("gr", "<cmd>Telescope lsp_references<cr>", "[G]oto [R]eferences")
		lsp_keymap("gi", vim.lsp.buf.implementation, "[g]oto [i]mplementation")
		lsp_keymap("gt", vim.lsp.buf.type_definition, "type [d]efinition")

		lsp_keymap("K", vim.lsp.buf.hover, "Hover Documentation")
	end,
})
