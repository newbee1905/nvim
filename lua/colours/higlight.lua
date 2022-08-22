local M = {}

---Validate input input from opts table and return a hex string if opt exists
---@param input string|Color|nil
---@return string
local function validate(input)
  return input and input or "NONE"
end

local function parse_style(style)
  if not style or style == "NONE" then
    return {}
  end

  local result = {}
  for token in string.gmatch(style, "([^,]+)") do
    result[token] = true
  end

  return result
end

M.parse_style = parse_style

local function should_link(link)
	return link and link ~= ""
end

--#region TYPES

---@class HighlightSpec
---@field fg string
---@field bg string
---@field style string
---@field sp string
---@field link string
---@field force boolean

--#endregion

M.highlight = function(highlights)
	for group, opts in pairs(highlights) do
		if should_link(opts.link) then
			vim.api.nvim_set_hl(0, group, {
				link = opts.link,
			})
		else
			local values = parse_style(opts.style)
			values.bg = opts.bg
			values.fg = opts.fg
			values.sp = opts.sp
			vim.api.nvim_set_hl(0, group, values)
		end
	end
end

return M
