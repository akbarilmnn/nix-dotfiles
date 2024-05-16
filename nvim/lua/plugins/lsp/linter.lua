return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			lua = { "selene" },
			javascript = { "oxlint" },
			typescript = { "oxlint" },
			c = { "cpplint" },
			cpp = { "cpplint" },
		}

		local group = vim.api.nvim_create_augroup("linter-group", { clear = true })

		vim.api.nvim_create_autocmd("BufWritePost", {
			group = group,
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
