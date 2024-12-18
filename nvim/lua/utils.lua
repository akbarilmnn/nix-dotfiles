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

return M
