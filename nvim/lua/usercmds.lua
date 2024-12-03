-- remove carriage return character (this is handy because i use wsl)
vim.api.nvim_create_user_command("Rmcrlf", function(_)
	vim.cmd([[%s/\r/ /g ]])
end, {})

-- Create a command `:Format` local to the LSP buffer
vim.api.nvim_create_user_command("Format", function(_)
	vim.lsp.buf.format()
end, { desc = "Format current buffer with LSP" })
