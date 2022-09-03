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
