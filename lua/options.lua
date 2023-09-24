local utils = require('utils')

local cmd = vim.cmd

utils.load_options()
utils.disable_distribution_plugins()
utils.disable_recommneded_style()

vim.defer_fn(function()
	cmd [[set foldmethod=expr]]
	cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
end, 0)

cmd [[colorscheme kanagawa]]
