require('core.options')
require('core.global')

vim.defer_fn(function()
	require('core.autocmd')
	require('core.plugins')
	require('core.mappings')
end, 0)
