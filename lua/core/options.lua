local global = require('global')
local cmd, defer_fn = vim.cmd, vim.defer_fn
local map = vim.keymap.set

local function load_options()
	vim.o.termguicolors   = true
	vim.o.errorbells      = true
	vim.o.visualbell      = true
	vim.o.hidden          = true
	vim.o.fileformats     = "unix,mac,dos"
	vim.o.magic           = true
	vim.o.virtualedit     = "block"
	vim.o.encoding        = "utf-8"
	vim.o.viewoptions     = "folds,cursor,curdir,slash,unix"
	vim.o.sessionoptions  = "curdir,help,tabpages,winsize"
	vim.o.clipboard       = "unnamedplus"
	vim.o.wildignorecase  = true
	vim.o.wildignore      = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
	vim.o.backup          = false
	vim.o.writebackup     = false
	vim.o.swapfile        = false
	vim.o.directory       = global.cache_dir .. "swag/"
	vim.o.undodir         = global.cache_dir .. "undo/"
	vim.o.backupdir       = global.cache_dir .. "backup/"
	vim.o.viewdir         = global.cache_dir .. "view/"
	vim.o.spellfile       = global.cache_dir .. "spell/en.uft-8.add"
	vim.o.history         = 2000
	vim.o.shada           = "!,'300,<50,@100,s10,h"
	vim.o.backupskip      = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
	vim.o.smarttab        = true
	vim.o.shiftround      = true
	vim.o.timeout         = true
	vim.o.ttimeout        = true
	vim.o.timeoutlen      = 500
	vim.o.ttimeoutlen     = 10
	vim.o.updatetime      = 100
	vim.o.redrawtime      = 1500
	vim.o.ignorecase      = true
	vim.o.smartcase       = true
	vim.o.infercase       = true
	vim.o.incsearch       = true
	vim.o.wrapscan        = true
	vim.o.complete        = ".,w,b,k"
	vim.o.inccommand      = "nosplit"
	vim.o.grepformat      = "%f:%l:%c:%m"
	vim.o.grepprg         = 'rg --hidden --vimgrep --smart-case --'
	vim.o.breakat         = [[\ \	;:,!?]]
	vim.o.startofline     = false
	vim.o.whichwrap       = "h,l,<,>,[,],~"
	vim.o.splitbelow      = true
	vim.o.splitright      = true
	vim.o.switchbuf       = "useopen"
	vim.o.backspace       = "indent,eol,start"
	vim.o.diffopt         = "filler,iwhite,internal,algorithm:patience"
	vim.o.completeopt     = "menuone,noselect"
	vim.o.jumpoptions     = "stack"
	vim.o.showmode        = false
	vim.o.shortmess       = "aoOTIcF"
	vim.o.scrolloff       = 2
	vim.o.sidescrolloff   = 5
	vim.o.foldlevelstart  = 99
	vim.o.ruler           = false
	vim.o.list            = true
	vim.o.winwidth        = 30
	vim.o.winminwidth     = 10
	vim.o.pumheight       = 15
	vim.o.helpheight      = 12
	vim.o.previewheight   = 12
	vim.o.showcmd         = false
	vim.o.cmdheight       = 2
	vim.o.cmdwinheight    = 5
	vim.o.equalalways     = false
	vim.o.laststatus      = 2
	vim.o.display         = "lastline"
	-- vim.o.showbreak       = "↳  "
	vim.o.listchars       = "tab:▏ ,nbsp:+,trail:·,extends:→,precedes:←"
	vim.o.pumblend        = 10
	vim.o.winblend        = 10
	vim.o.mouse       	  = 'a'
	vim.o.number          = true
	vim.o.numberwidth     = 2
	vim.o.relativenumber  = true
	vim.o.cursorline		  = true
	vim.o.undofile        = true
	vim.o.synmaxcol       = 2500
	vim.o.formatoptions   = "1jcroql"
	vim.o.textwidth       = 80
	vim.o.autoindent      = true
	vim.o.tabstop         = 2
	vim.o.shiftwidth      = 2
	vim.o.expandtab       = false
	vim.o.softtabstop     = -1
	vim.o.breakindentopt  = "shift:2,min:20"
	vim.o.wrap            = false
	vim.o.linebreak       = true
	vim.o.foldenable      = true
	vim.o.signcolumn      = "yes"
	vim.o.conceallevel    = 0
	vim.o.concealcursor   = "niv"
	vim.o.spelllang       = "en_gb"

	if global.is_mac then
		vim.g.clipboard = {
			name = "macOS-clipboard",
			copy = {
				["+"] = "pbcopy",
				["*"] = "pbcopy",
			},
			paste = {
				["+"] = "pbpaste",
				["*"] = "pbpaste",
		},
		cache_enabled = 0
		}
		vim.g.python_host_prog = '/usr/bin/python'
		vim.g.python3_host_prog = '/usr/local/bin/python3'
	end
end

local disable_distribution_plugins = function()
	vim.g.loaded_gzip              = 1
	vim.g.loaded_tar               = 1
	vim.g.loaded_tarPlugin         = 1
	vim.g.loaded_zip               = 1
	vim.g.loaded_zipPlugin         = 1
	vim.g.loaded_getscript         = 1
	vim.g.loaded_getscriptPlugin   = 1
	vim.g.loaded_vimball           = 1
	vim.g.loaded_vimballPlugin     = 1
	vim.g.loaded_matchit           = 1
	vim.g.loaded_matchparen        = 1
	vim.g.loaded_2html_plugin      = 1
	vim.g.loaded_logiPat           = 1
	vim.g.loaded_rrhelper          = 1
	vim.g.loaded_netrw             = 1
	vim.g.loaded_netrwPlugin       = 1
	vim.g.loaded_netrwSettings     = 1
	vim.g.loaded_netrwFileHandlers = 1
end

local disable_recommneded_style = function()
	vim.g.python_recommended_style = 0
	vim.g.rust_recommended_style = 0
	vim.g.ruby_recommended_style = 0
	vim.g.go_recommended_style = 0
	vim.g.lua_recommended_style = 0
	vim.g.hare_recommended_style = 0
end

local leader_map = function()
	vim.g.mapleader = " "
	map('n',' ','',{ noremap = true })
	map('x',' ','',{ noremap = true })
end

load_options()
leader_map()
disable_distribution_plugins()
disable_recommneded_style()

local theme = 'night-owl'

require 'utils.base16':apply(require('theme.' .. theme .. '-base16'))

defer_fn(function()
	vim.pretty_print(require('theme.'..theme))
	require 'utils.highlight':highlight(require('theme.'..theme))


	cmd [[set foldmethod=expr]]
	cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
end, 0)


defer_fn(function()
	cmd [[set foldmethod=expr]]
	cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
end, 0)
