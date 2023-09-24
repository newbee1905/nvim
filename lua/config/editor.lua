local _M = {}

_M["nvim-autopairs"] = function(_, opts)
	local npairs = require("nvim-autopairs")
	npairs.setup(opts)
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({
		map_char = {
			tex = ""
		}
	}))
end

_M["nvim-cmp"] = function(_, opts)
	require("cmp").setup(opts)
end

return _M
