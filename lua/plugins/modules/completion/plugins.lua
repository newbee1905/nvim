local use = require 'plugins'.register_plugin
local conf = require('plugins.modules.completion.configs')

-- Complition
use 'ms-jpq/coq_nvim' {
	branch = 'coq',
	config = conf.coq_nvim,
	setup = 'coq_nvim',
}
use 'ms-jpq/coq.artifacts' {
	after = 'coq_nvim',
	branch = 'artifacts',
}
use 'ms-jpq/coq.thirdparty' {
	after = 'coq_nvim',
	branch = '3p',
}

use "hrsh7th/nvim-cmp" {
	event = "InsertEnter",
	requires = {
		{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
		{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		{ "hrsh7th/cmp-path", after = "nvim-cmp" },
		{ "ray-x/cmp-treesitter", after = "nvim-cmp" }
		-- { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
	},
	config = conf.cmp,
}
