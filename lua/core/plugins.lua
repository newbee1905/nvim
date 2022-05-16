local present, pack = pcall(require, 'utils.pack')

if not present then
	return false
end

local packer = pack.packer
local use = packer.use
local conf = require('core.configs')

return packer.startup(function()
	local lazy = require'utils.pack'.lazy

	-- Important plugins
	use {
		'lewis6991/impatient.nvim',
		config = conf.impatient,
	}
	-- use 'nathom/filetype.nvim'
	use {
		'wbthomason/packer.nvim',
		opt = true,
	}

	-- Utilites
	use 'nvim-lua/plenary.nvim'
	use {
		'dstein64/vim-startuptime',
		opt = true,
	}
	use {
		'mbbill/undotree',
		opt = true,
		config = conf.undotree,
		setup = lazy'undotree',
	}
	use {
		'numToStr/Comment.nvim',
		opt = true,
		config = conf.comment,
		setup = lazy'Comment.nvim'
	}
	use {
		'preservim/vim-pencil',
		ft={'markdown', ''},
	}
	use {
		'folke/zen-mode.nvim',
		conf = conf.zen_mode,
		ft={'markdown', ''},
	}
	use {
		"SmiteshP/nvim-gps",
		opt = true,
		after = "nvim-treesitter",
		config = conf.nvim_gps,
		setup = lazy'nvim-gps'
	}

	-- Telescope
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		opt = true,
		run = 'make',
		setup = lazy'telescope-fzf-native.nvim'
	}
	use {
		'nvim-telescope/telescope-packer.nvim',
		opt = true,
		setup = lazy'telescope-packer.nvim'
	}
	use {
		'nvim-telescope/telescope.nvim',
		opt = true,
		config = conf.telescope,
		setup = lazy'telescope.nvim'
	}

	-- UI plugins
	use {
		'norcalli/nvim-colorizer.lua',
		opt = true,
		config = conf.nvim_colorizer,
		setup = lazy'nvim-colorizer.lua',
	}
	-- use {
	-- 	'glepnir/dashboard-nvim',
	-- 	config = conf.dashboard,
	-- }
	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = conf.dashboard,
	}
	use {
		'ntbbloodbath/galaxyline.nvim',
		opt = true,
		config = conf.galaxyline,
		requires = { 'kyazdani42/nvim-web-devicons' },
		setup = lazy'galaxyline.nvim'
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		opt = true,
		config = conf.indent_blankline,
		setup = lazy'indent-blankline.nvim',
	}
	use {
		'lewis6991/gitsigns.nvim',
		opt = true,
		config = conf.gitsigns,
		setup = lazy('gitsigns.nvim', 40),
	}

	-- Highlight/Syntax plugins
	use {
		'nvim-treesitter/nvim-treesitter',
		-- after = 'telescope.nvim',
		opt = true,
		config = conf.nvim_treesitter,
		setup = lazy'nvim-treesitter',
	}
	use {
		'nvim-treesitter/nvim-treesitter-textobjects',
		opt = true,
		after = 'nvim-treesitter',
		setup = lazy'nvim-treesitter-textobjects',
	}
	-- Add supoprt for crystal programming language
	use 'vim-crystal/vim-crystal'
	use 'pigpigyyy/moonplus-vim'

	-- Complition
	use {
		'ms-jpq/coq_nvim',
		opt = true,
		branch = 'coq',
		config = conf.coq_nvim,
		setup = lazy'coq_nvim',
	}

	-- LSP
	use {
		'neovim/nvim-lspconfig',
		opt = true,
		after = 'coq_nvim',
		setup = lazy'nvim-lspconfig',
	}
	use {
		'williamboman/nvim-lsp-installer',
		opt = true,
		after = 'nvim-lspconfig',
		config = conf.nvim_lsp_installer,
		setup = lazy'nvim-lsp-installer',
	}

	-- Movement
	use {
		'xiyaowong/accelerated-jk.nvim',
		opt = true,
		config = conf.accelerated_jk,
		setup = lazy'accelerated-jk.nvim',
	}
	use {
		'karb94/neoscroll.nvim',
		opt = true,
		config = conf.neoscroll,
		setup = lazy'neoscroll.nvim',
	}
	use {
		'ggandor/lightspeed.nvim',
		opt = true,
		config = conf.lightspeed,
		setup = lazy'lightspeed.nvim'
	}

	-- Extras + Custom Plugin
	use {
		'max397574/better-escape.nvim',
		opt = true,
		config = conf.better_escape,
		setup = lazy'better-escape.nvim',
	}
	use {
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = conf.nvim_autpairs,
	}
	-- R.I.P - private plugin
	-- Mah Fiend is lazy now
	-- use {
	-- 	'tuwuna/cp.nvim',
	-- 	opt = true,
	-- 	config = conf.cp,
	-- 	setup = lazy('cp.nvim', 100),
	-- }

	local present, compile = pcall(require, 'fvim_compiled')
	if not present then
		packer.sync()
		require('fvim_compiled')
	end
end)
