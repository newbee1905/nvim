require('options')

_G.cmd, _G.fn, _G.uv, _G.defer_fn = vim.cmd, vim.fn, vim.loop, vim.defer_fn

_G.lazy = require'utils.pack.lazy'.lazy

vim.defer_fn(function()
	require('autocmd')
	require('plugins')
	require('mappings')
end, 0)
