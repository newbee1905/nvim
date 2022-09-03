require('options')

_G.fn, _G.uv, _G.defer_fn, _G.api, _G.lazy_fn, _G.notify = vim.fn, vim.loop, vim.defer_fn, vim.api, vim.schedule, vim.notify
_G.cmd = api.nvim_command

_G.lazy = require 'utils.pack.lazy'.lazy

lazy_fn(function()
	require('autocmd')
	require('mappings')
	local pack = require('plugins')
	pack.ensure_plugins()
	pack.load_compile()
end)
