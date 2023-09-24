local config = require('config.editor')
local opts = require('opts.editor')

return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- "hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
		},
		opts = opts['nvim-cmp'],
		config = config['nvim-cmp'],
	},
	{
		-- Autopairs
		"windwp/nvim-autopairs",
		opts = opts["nvim-autopairs"],
		config = config["nvim-autopairs"],
	}
}
