local defer_fn = vim.defer_fn

-- _G.lazy = require'utils.pack'.lazy

_G.lazy = function(plugin, timer)
	if plugin then
		timer = timer or 0
		defer_fn(function()
			require'packer'.loader(plugin)
		end, timer)
	end
end
