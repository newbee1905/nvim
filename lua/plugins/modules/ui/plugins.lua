local use = require 'plugins'.register_plugin
local conf = require('plugins.modules.ui.configs')

-- UI plugins
use "catppuccin/nvim" {
	as = "theme",
	run = ":CatppuccinCompile",
	config = conf.theme,
}
use 'norcalli/nvim-colorizer.lua' {
	config = conf.nvim_colorizer,
	setup = 'nvim-colorizer.lua',
}
-- use glepnir/dashboard-nvim' {
-- 	config = conf.dashboard,
-- }
use 'goolord/alpha-nvim' {
	requires = { 'kyazdani42/nvim-web-devicons' },
	config = conf.dashboard,
}
use 'ntbbloodbath/galaxyline.nvim' {
	config = conf.galaxyline,
	requires = { 'kyazdani42/nvim-web-devicons' },
	after = "theme",
	setup = 'galaxyline.nvim'
}
use 'lukas-reineke/indent-blankline.nvim' {
	config = conf.indent_blankline,
	setup = 'indent-blankline.nvim',
}
use 'lewis6991/gitsigns.nvim' {
	config = conf.gitsigns,
	setup = 'gitsigns.nvim',
}

-- Highlight/Syntax plugins
-- use newbee1905/nightfox.nvim' {
-- 	config = conf.nightfox,
-- }
use 'nvim-treesitter/nvim-treesitter' {
	-- after = 'telescope.nvim',
	config = conf.nvim_treesitter,
	setup = 'nvim-treesitter',
}
use 'nvim-treesitter/nvim-treesitter-textobjects' {
	after = 'nvim-treesitter',
	setup = 'nvim-treesitter-textobjects',
}
-- Add supoprt for crystal programming language
use 'vim-crystal/vim-crystal'
-- Add supoprt for moonscript programming language
use 'pigpigyyy/moonplus-vim'
-- Add supoprt for rhai programming language
use 'kuon/rhai.vim'
-- Latex support
use 'lervag/vimtex' {
	config = conf.vimtex,
	setup = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*.tex",
			callback = function()
				require 'utils.pack'.lazy 'vimtex'
			end
		})
	end
}

use 'https://git.sr.ht/~newbee1905/hare.vim' { module = "hare.nvim" }
