local M = {}

M.lazy = function(plugin, timer)
	if plugin then
		timer = timer or 0
		defer_fn(function()
			require'packer'.loader(plugin)
		end, timer)
	end
end

return M
