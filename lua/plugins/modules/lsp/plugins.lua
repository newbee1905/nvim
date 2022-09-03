local use = require 'plugins'.register_plugin
local conf = require('plugins.modules.utils.configs')

-- LSP
use 'neovim/nvim-lspconfig' {
	after = 'coq_nvim',
	setup = 'nvim-lspconfig',
}
use 'williamboman/nvim-lsp-installer' {
	after = 'nvim-lspconfig',
	config = conf.nvim_lsp_installer,
	setup = 'nvim-lsp-installer',
}
