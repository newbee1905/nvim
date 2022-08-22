local has = vim.fn.has

local M = {}

---Shallow copy table -> Only copy value
---@param org table
function M.shallow_copy(org)
	local copy
	if type(org) == 'table' then
		copy = {}
		for i = 1, #org do
			copy[i] = org[i]
		end
	else -- number, string, etc.
		copy = org
	end
	return copy
end

---Clamp value between the min and max values.
---@param value number
---@param min number
---@param max number
function M.clamp(value, min, max)
  if value < min then
    return min
  elseif value > max then
    return max
  end
  return value
end


M.is_nvim = has("nvim") == 1
M.use_nvim_api = M.is_nvim and has("nvim-0.7") == 1

return M
