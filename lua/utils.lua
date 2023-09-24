local global = require('global')
local cmd, o, g = vim.cmd, vim.o, vim.g
local map = vim.keymap.set

local _M = {}

_M.load_options = function()
	o.termguicolors   = true
	o.errorbells      = true
	o.visualbell      = true
	o.hidden          = true
	o.fileformats     = "unix,mac,dos"
	o.magic           = true
	o.virtualedit     = "block"
	o.encoding        = "utf-8"
	o.viewoptions     = "folds,cursor,curdir,slash,unix"
	o.sessionoptions  = "curdir,help,tabpages,winsize"
	o.clipboard       = "unnamedplus"
	o.wildignorecase  = true
	o.wildignore      = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
	o.backup          = false
	o.writebackup     = false
	o.swapfile        = false
	o.directory       = global.cache_dir .. "swag/"
	o.undodir         = global.cache_dir .. "undo/"
	o.backupdir       = global.cache_dir .. "backup/"
	o.viewdir         = global.cache_dir .. "view/"
	o.spellfile       = global.cache_dir .. "spell/en.uft-8.add"
	o.history         = 2000
	o.shada           = "!,'300,<50,@100,s10,h"
	o.backupskip      = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
	o.smarttab        = true
	o.shiftround      = true
	o.timeout         = true
	o.ttimeout        = true
	o.timeoutlen      = 500
	o.ttimeoutlen     = 10
	o.updatetime      = 100
	o.redrawtime      = 1500
	o.ignorecase      = true
	o.smartcase       = true
	o.infercase       = true
	o.incsearch       = true
	o.wrapscan        = true
	o.complete        = ".,w,b,k"
	o.inccommand      = "nosplit"
	o.grepformat      = "%f:%l:%c:%m"
	o.grepprg         = 'rg --hidden --vimgrep --smart-case --'
	o.breakat         = [[\ \	;:,!?]]
	o.startofline     = false
	o.whichwrap       = "h,l,<,>,[,],~"
	o.splitbelow      = true
	o.splitright      = true
	o.switchbuf       = "useopen"
	o.backspace       = "indent,eol,start"
	o.diffopt         = "filler,iwhite,internal,algorithm:patience"
	o.completeopt     = "menuone,noselect"
	o.jumpoptions     = "stack"
	o.showmode        = false
	o.shortmess       = "aoOTIcF"
	o.scrolloff       = 2
	o.sidescrolloff   = 5
	o.foldlevelstart  = 99
	o.ruler           = false
	o.list            = true
	o.winwidth        = 30
	o.winminwidth     = 10
	o.pumheight       = 15
	o.helpheight      = 12
	o.previewheight   = 12
	o.showcmd         = false
	o.cmdheight       = 2
	o.cmdwinheight    = 5
	o.equalalways     = false
	o.laststatus      = 3
	o.display         = "lastline"
	o.showbreak       = "↳  "
	o.listchars       = "tab:▏ ,nbsp:+,trail:·,extends:→,precedes:←"
	o.pumblend        = 10
	o.winblend        = 10
	o.mouse       	  = 'a'
	o.number          = true
	o.numberwidth     = 2
	o.relativenumber  = true
	o.cursorline		  = true
	o.undofile        = true
	o.synmaxcol       = 2500
	o.formatoptions   = "1jcroql"
	o.textwidth       = 100
	o.autoindent      = true
	o.tabstop         = 2
	o.shiftwidth      = 2
	o.expandtab       = false
	o.softtabstop     = -1
	o.breakindentopt  = "shift:2,min:20"
	o.wrap            = false
	o.linebreak       = true
	o.foldenable      = true
	o.signcolumn      = "yes"
	o.colorcolumn     = "100"
	o.conceallevel    = 0
	o.concealcursor   = "niv"
	o.spelllang       = "en_gb"

	if global.is_mac then
		g.clipboard = {
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
		g.python_host_prog = '/usr/bin/python'
		g.python3_host_prog = '/usr/local/bin/python3'
	end

	g.python_host_prog = '/usr/bin/python'
	g.python3_host_prog = '/usr/bin/python3'
end

_M.disable_distribution_plugins = function()
	g.loaded_gzip              = 1
	g.loaded_tar               = 1
	g.loaded_tarPlugin         = 1
	g.loaded_zip               = 1
	g.loaded_zipPlugin         = 1
	g.loaded_getscript         = 1
	g.loaded_getscriptPlugin   = 1
	g.loaded_vimball           = 1
	g.loaded_vimballPlugin     = 1
	g.loaded_matchit           = 1
	g.loaded_matchparen        = 1
	g.loaded_2html_plugin      = 1
	g.loaded_logiPat           = 1
	g.loaded_rrhelper          = 1
	g.loaded_netrw             = 1
	g.loaded_netrwPlugin       = 1
	g.loaded_netrwSettings     = 1
	g.loaded_netrwFileHandlers = 1
end

_M.disable_recommneded_style = function()
	-- g.python_recommended_style = 0
	g.rust_recommended_style = 0
	g.ruby_recommended_style = 0
	g.go_recommended_style = 0
	g.lua_recommended_style = 0
	g.hare_recommended_style = 0
end

_M.leader_map = function()
	vim.g.mapleader = " "
	map('n',' ','',{ noremap = true })
	map('x',' ','',{ noremap = true })
end

return _M
