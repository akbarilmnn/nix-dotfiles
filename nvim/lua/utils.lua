local M = {}

local function has_dep(cmd)
	return vim.fn.executable(cmd) == 1
end

function M.check_deps_with_fallback(deps)
	for _, pair in ipairs(deps) do
		local found = false
		local curr_cmd = ""
		for _, cmd in ipairs(pair) do
			if has_dep(cmd) then
				found = true
				break
			end
			curr_cmd = cmd
		end
		if not found then
			print("ERROR: " .. curr_cmd .. "is not installed!")
			return false
		end
	end
	return true
end

function M.on_attach(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	-- mappings for diagnostics
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("gt", vim.lsp.buf.type_definition, "Type [D]efinition")

	nmap("K", vim.lsp.buf.hover, "Hover Documentation")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

return M
