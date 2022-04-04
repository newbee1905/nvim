utils = {}

function utils:shallow_copy(orig)
	local copy
	if type(orig) == 'table' then
		copy = {}
		for i = 1, #orig do
			copy[i] = orig[i]
		end
	else -- number, string, etc.
		copy = org
	end
	return copy
end

-- Get from NvChad
function utils:map(mode, keys, cmd, opt)
	local options = { noremap = true, silent = true }
	if opt then
		options = vim.tbl_extend("force", options, opt)
	end

	-- all valid modes allowed for mappings
	-- :h map-modes
	local valid_modes = {
		[""] = true,
		["n"] = true,
		["v"] = true,
		["s"] = true,
		["x"] = true,
		["o"] = true,
		["!"] = true,
		["i"] = true,
		["l"] = true,
		["c"] = true,
		["t"] = true,
	}

	-- helper function for M.map
	-- can gives multiple modes and keys
	local map_wrapper = function(sub_mode, lhs, rhs, sub_options)
		if type(lhs) == "table" then
			for i = 1, #lhs do
				map_wrapper(sub_mode, lhs[i], rhs, sub_options)
			end
		else
			if type(sub_mode) == "table" then
				for i = 1, #sub_mode do
					map_wrapper(sub_mode[i], lhs, rhs, sub_options)
				end
			else
				if valid_modes[sub_mode] and lhs and rhs then
					vim.api.nvim_set_keymap(sub_mode, lhs, rhs, sub_options)
				else
					sub_mode, lhs, rhs = sub_mode or "", lhs or "", rhs or ""
					print(
						"Cannot set mapping [ mode = '" .. sub_mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]"
					)
				end
			end
		end
	end

	map_wrapper(mode, keys, cmd, options)
end

return utils
