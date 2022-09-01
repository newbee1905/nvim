local present, pack = pcall(require, 'utils.pack')

if not present then
	return false
end

local packer = pack.packer
local use = require 'utils.pack'.use

local conf = require('core.configs')

return packer.startup(function()
	local lazy = require 'utils.pack'.lazy
	-- Important plugins
	use 'lewis6991/impatient.nvim' { config = conf.impatient }
	-- use 'nathom/filetype.nvim'
	use 'wbthomason/packer.nvim' { opt = true }

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
		setup = 'telescope-packer.nvim'
	}
	use 'nvim-telescope/telescope.nvim' {
		config = conf.telescope,
		setup = 'telescope.nvim'
	}

	-- UI plugins
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
		setup = 'galaxyline.nvim'
	}
	use 'lukas-reineke/indent-blankline.nvim' {
		config = conf.indent_blankline,
		setup = 'indent-blankline.nvim',
	}
	use 'lewis6991/gitsigns.nvim' {
		config = conf.gitsigns,
		setup = lazy('gitsigns.nvim', 40),
	}
	use 'andweeb/presence.nvim' {
		-- opt = true,
		config = conf.presence,
		-- setup = lazy'presence.nvim',
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

	local present, compile = pcall(require, 'nvim_compiled')
	if not present then
		packer.sync()
		require('nvim_compiled')
	end
end)
