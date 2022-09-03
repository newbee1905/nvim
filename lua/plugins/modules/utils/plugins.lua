local use = require 'plugins'.register_plugin
local conf = require('plugins.modules.utils.configs')

-- Important plugins
use 'lewis6991/impatient.nvim' { config = conf.impatient }

use 'wbthomason/packer.nvim' {
	opt = true,
	config = [[vim.g.startuptime_tries = 10]]
}

-- Utilites
use "nvim-lua/plenary.nvim" { module = "plenary" }
use 'dstein64/vim-startuptime' { opt = true }

use 'mbbill/undotree' {
	config = conf.undotree,
	setup = 'undotree',
}
use 'numToStr/Comment.nvim' {
	config = conf.comment,
	setup = 'Comment.nvim'
}
use 'preservim/vim-pencil' {
	ft = { 'markdown', '' },
}
use 'folke/zen-mode.nvim' {
	conf = conf.zen_mode,
	ft = { 'markdown', '' },
}

use "SmiteshP/nvim-gps" {
	after = "nvim-treesitter",
	config = conf.nvim_gps,
	setup = 'nvim-gps'
}

-- Telescope
use 'nvim-telescope/telescope-fzf-native.nvim' {
	run = 'make',
	setup = 'telescope-fzf-native.nvim'
}
use 'nvim-telescope/telescope-packer.nvim' {
	setup = 'telescope-packer.nvim',
	after = 'telescope-fzf-native.nvim'
}
use 'nvim-telescope/telescope.nvim' {
	config = conf.telescope,
	setup = 'telescope.nvim',
	after = 'telescope-packer.nvim'
}

-- Movement
use 'xiyaowong/accelerated-jk.nvim' {
	config = conf.accelerated_jk,
	setup = 'accelerated-jk.nvim',
}
use 'karb94/neoscroll.nvim' {
	config = conf.neoscroll,
	setup = 'neoscroll.nvim',
}
use 'ggandor/lightspeed.nvim' {
	config = conf.lightspeed,
	setup = 'lightspeed.nvim'
}

-- Extras + Custom Plugin
use 'max397574/better-escape.nvim' {
	config = conf.better_escape,
	setup = 'better-escape.nvim',
}
use 'windwp/nvim-autopairs' {
	event = 'InsertEnter',
	config = conf.nvim_autpairs,
}
-- R.I.P - private plugin
-- Mah Fiend is lazy now
-- use tuwuna/cp.nvim' {
-- 	opt = true,
-- 	config = conf.cp,
-- 	setup = lazy('cp.nvim', 100),
-- }
