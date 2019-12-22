" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║     
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

call plug#begin()

" Fugitive Vim Github Wrapper
Plug 'tpope/vim-fugitive'

" My theme
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'

" Add icons
Plug 'ryanoasis/vim-devicons'

" Using fzf as fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Undo tree for vim
" Using mundo instead of gundo
Plug 'simnalamburt/vim-mundo'

" Extra syntax
Plug 'sheerun/vim-polyglot'
" CMakeLists syntax
Plug 'pboettch/vim-cmake-syntax'
" ** CMakeLists syntax
Plug 'pboettch/vim-cmake-syntax'
" ** javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
" ** cpp 
Plug 'bfrg/vim-cpp-modern'
Plug 'octol/vim-cpp-enhanced-highlight'

" Auto completion that using server
" Switch form YCM
" Latest tag
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" Add ability to comment in vim
Plug 'tpope/vim-commentary'

" autopair for vim
Plug 'jiangmiao/auto-pairs'

" Manage file
Plug 'scrooloose/nerdtree'

call plug#end()

" ------------------------------------------------------------------
" My normal vim set up
" ------------------------------------------------------------------

" For plug-ins to load correctly.
filetype plugin indent on

" Turn on syntax highlighting.
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" force 256 colors on the terminal
set t_Co=256
syntax on
" Gruvbox-material theme set up
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 1
" Gruvbox theme setup
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
set background=dark
" OceanicNext theme setup
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" Nord theme set up
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
" brightness from 1 -> 20
let g:nord_comment_brightness = 12
colorscheme nord

set encoding=UTF-8

set number
set relativenumber

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set autoindent
set noexpandtab
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Display options
set showmode
set showcmd

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying larg amounts of data between files.
set viminfo='100,<9999,s100

let mapleader = ','

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Copy and Paste outside vim
nnoremap y "+y
vnoremap y "+y
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" Map esc to jjj+k no matter order so both can be pressed at the same time
imap jj <Esc>
imap jk <Esc>
imap kj <Esc>

" move between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" restart vim after update
nnoremap <C-r> :so %<CR>

" ********************
" Basic set up for coc
" ********************

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" ********************

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Customize my statusline
" ------------------------------------------------------------------

" ********************
" SYNTAX HIGHLIGHT GROUP
" ********************

function! SyntaxItem()
	let l:syntaxname = synIDattr(synID(line("."),col("."),1),"name")

	if l:syntaxname != ""
		return l:syntaxname
	else
		return ""
	endif
endfunction

" ********************

" ********************
" VIM MODES
" ********************

let g:currentmode={
	\'n'  : 'Normal',
	\'no' : 'Normal/Op/Pend',
	\'v'  : 'Visual',
	\'V'  : 'Visual/Line',
	\'^V' : 'Visual/Block',
	\'s'  : 'Select',
	\'S'  : 'Select/Line',
	\'^S' : 'Select/Block',
	\'i'  : 'Insert',
	\'R'  : 'Replace',
	\'Rv' : 'Visual/Replace',
	\'c'  : 'Command',
	\'cv' : 'Vim Ex',
	\'ce' : 'Ex',
	\'r'  : 'Prompt',
	\'rm' : 'More',
	\'r?' : 'Confirm',
	\'!'  : 'Shell',
	\'t'  : 'Terminal'
\}

function! ModeCurrent() abort
	let l:modecurrent = mode()
	let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'Visual/Block'))
	let l:current_status_mode = l:modelist

	return l:current_status_mode
endfunction

" ********************

" ********************
" READ ONLY FLAG 
" ********************

function! ReadOnly()
	if &readonly || !&modifiable
		return 'READONLY'
	else
		return ''
	endif
endfunction

" ********************

" ********************
" MODIFIED CHECK FLAG
" ********************

function! Modified()
	if &modified
		return 'modified'
	else
		return ''
	endif
endfunction

" ********************

" ********************
" NERDTREE
" ********************

let NERDTreeStatusline="%4*\ NERDTree\ %1*"

" ********************

" Always show statusline
set laststatus=2

" Format active statusline
function! ActiveStatusLine()
	" Reset statusline
	let l:statusline=""
	" Color by mode
	if (mode() =~# '\v(n|no)')
		let l:statusline.="%5*"
	elseif (mode() =~# '\v(c|ce|cv)')
		let l:statusline.="%8*"
	else
		let l:statusline.="%3*"
	endif
	" Mode
	let l:statusline.="\ %{ModeCurrent()}\ "
	" Separator
	let l:statusline.="%1*\ "
	" Current line number, total line numbers
	let l:statusline.="%6*\ %l:%L\ "
	" Separator
	let l:statusline.="%1*\ "
	" Filename
	let l:statusline.="%7*\ %t\ "
	" Separator
	let l:statusline.="%1*\ "
	" Show if file is readonly
	if ReadOnly() != ""
		let l:statusline.="%4*\ %{ReadOnly()}\ "
		" Separator
		let l:statusline.="%1*\ "
	endif
	" Show if file has been modified
	if Modified() != ""
		let l:statusline.="%8*\ %{Modified()}\ "
		" Separator
		let l:statusline.="%1*\ "
	endif
	" Spacer
	let l:statusline.="%1*%="
	" Show syntax identifier, if any
	if SyntaxItem() != ""
		let l:statusline.="%4*\ %{SyntaxItem()}\ "
		" Separator
		let l:statusline.="%1*\ "
	endif
	" File encoding
	let l:statusline.="%7*\ %{(&fenc!=''?&fenc:&enc)}\ "
	" Separator
	let l:statusline.="%1*\ "
	" File format
	let l:statusline.="%5*\ %{&ff}\ "
	" Done
	return l:statusline
endfunction

" Format inactive statusline
function! InactiveStatusLine()
	" Reset statusline
	let l:statusline=""
	" Filename
	let l:statusline.="%8*\ %t\ "
	" Spacer
	let l:statusline.="%1*%="
	" File encoding
	let l:statusline.="%8*\ %{(&fenc!=''?&fenc:&enc)}\ "
	" Separator
	let l:statusline.="%1*\ "
	" File format
	let l:statusline.="%8*\ %{&ff}\ "
	" Done
	return l:statusline
endfunction

" Set active statusline
function! SetActiveStatusLine()
	if &ft ==? 'nerdtree'
		return
	endif

	set statusline=
	set statusline+=%!ActiveStatusLine()
endfunction

" Set inactive statusline
function! SetInactiveStatusLine()
	if &ft ==? 'nerdtree'
		return
	endif

	set statusline=
	set statusline+=%!InactiveStatusLine()
endfunction

" Autocmd statusline
augroup statusline
	autocmd!
	autocmd WinEnter,BufEnter * call SetActiveStatusLine()
	autocmd WinLeave,BufLeave * call SetInactiveStatusLine()
augroup end

hi User1 ctermbg=NONE ctermfg=NONE   guibg=NONE guifg=NONE
hi User3 ctermbg=white  ctermfg=black guibg=#d8dee9 guifg=#2e3440
hi User4 ctermbg=white  ctermfg=black guibg=#d8dee9 guifg=#2e3440
hi User5 ctermbg=cyan  ctermfg=black guibg=#81a1c1 guifg=#2e3440
hi User6 ctermbg=red  ctermfg=white guibg=#bf616a guifg=#d8dee9
hi User7 ctermbg=178  ctermfg=white guibg=#d08770 guifg=#d8dee9
hi User8 ctermbg=blue  ctermfg=green guibg=#88c0d0 guifg=#2e3440

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Set up fuzzy finder
" ------------------------------------------------------------------

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

nnoremap <C-f> :BLines<CR>
nnoremap <leader>p :Files<CR>

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let height = float2nr((&lines - 2) / 1.5)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns / 1.5)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
    \ 'relative': 'editor',
    \ 'row': row - 1,
    \ 'col': col - 2,
    \ 'width': width + 4,
    \ 'height': height + 2,
    \ 'style': 'minimal'
    \ }
  " Main Window
  let opts = {
    \ 'relative': 'editor',
    \ 'row': row,
    \ 'col': col,
    \ 'width': width,
    \ 'height': height
    \ }

  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  call nvim_open_win(buf, v:true, opts)
endfunction

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Set up CoC for auto completion
" ------------------------------------------------------------------

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Set up mundo
" ------------------------------------------------------------------

nnoremap <leader>u :MundoToggle<CR>
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Set up commenter
" ------------------------------------------------------------------

nmap <leader>/ gcc
xmap <leader>/ gc

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Set up floating terminal
" ------------------------------------------------------------------

function! OpenFloatTerm()
  let height = float2nr((&lines - 2) / 1.5)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns / 1.5)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
    \ 'relative': 'editor',
    \ 'row': row - 1,
    \ 'col': col - 2,
    \ 'width': width + 4,
    \ 'height': height + 2,
    \ 'style': 'minimal'
    \ }
  let border_buf = nvim_create_buf(v:false, v:true)
  let s:border_win = nvim_open_win(border_buf, v:true, border_opts)
  " Main Window
  let opts = {
    \ 'relative': 'editor',
    \ 'row': row,
    \ 'col': col,
    \ 'width': width,
    \ 'height': height,
    \ 'style': 'minimal'
    \ }
  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)
  terminal
  startinsert
  " Hook up TermClose event to close both terminal and border windows
  autocmd TermClose * ++once :q | call nvim_win_close(s:border_win, v:true)
endfunction
nnoremap <C-t> :call OpenFloatTerm()<CR>

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" NERDTree set up
" ------------------------------------------------------------------

let s:gui = {}

let s:gui.white      = { "default": "#e5e9f0" }
let s:gui.black      = { "default": "#2e3440" }
let s:gui.red        = { "default": "#bf616a" }
let s:gui.green      = { "default": "#a3be8c" }
let s:gui.yellow     = { "default": "#ebcb8b" }
let s:gui.blue       = { "default": "#5e81ac" }
let s:gui.magenta    = { "default": "#b48ead" }
let s:gui.cyan       = { "default": "#88c0d0" }
let s:gui.none       = { "default": "NONE" }

function! s:gui(color)
	if exists("g:slate_style")
		return a:color[s:style]
	else
		return a:color["default"]
	endif
endfunction

function! NERDTreeHighlightFile(extension, guifg, guibg)
	exec "autocmd filetype nerdtree syn match " . a:extension . ' #^\s\+.*' . a:extension . "$#"
	exec "autocmd filetype nerdtree highlight " . a:extension . " guibg=" . s:gui(a:guibg) . " guifg=" . s:gui(a:guifg)
endfunction

" NERDTREE FILE HIGHLIGHTING
call NERDTreeHighlightFile("ts",               s:gui.cyan,        s:gui.none)
call NERDTreeHighlightFile("tsx",              s:gui.cyan,        s:gui.none)
call NERDTreeHighlightFile("conf",             s:gui.cyan,        s:gui.none)
call NERDTreeHighlightFile("config",           s:gui.cyan,        s:gui.none)
call NERDTreeHighlightFile("yml",              s:gui.cyan,        s:gui.none)

call NERDTreeHighlightFile("js",               s:gui.yellow,      s:gui.none)
call NERDTreeHighlightFile("jsx",              s:gui.yellow,      s:gui.none)
call NERDTreeHighlightFile("json",             s:gui.yellow,      s:gui.none)

call NERDTreeHighlightFile("css",              s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("scss",             s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("less",             s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("html",             s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("xml",              s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("md",               s:gui.green,       s:gui.none)
call NERDTreeHighlightFile("vim",              s:gui.green,       s:gui.none)


call NERDTreeHighlightFile("dockerignore",     s:gui.magenta,     s:gui.none)
call NERDTreeHighlightFile("gitignore",        s:gui.magenta,     s:gui.none)
call NERDTreeHighlightFile("eslint",           s:gui.magenta,     s:gui.none)
call NERDTreeHighlightFile("babelrc",          s:gui.magenta,     s:gui.none)

call NERDTreeHighlightFile("sh",               s:gui.blue,        s:gui.none)
call NERDTreeHighlightFile("lua",              s:gui.blue,        s:gui.none)
call NERDTreeHighlightFile("php",              s:gui.blue,        s:gui.none)

call NERDTreeHighlightFile("jpg",              s:gui.white,       s:gui.none)
call NERDTreeHighlightFile("png",              s:gui.white,       s:gui.none)
call NERDTreeHighlightFile("svg",              s:gui.white,       s:gui.none)

let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeDirArrowExpandable = "•"
let g:NERDTreeDirArrowCollapsible = "•"
let g:NERDTreeWinSize = 31

" Map nerdtreetoggle to ctrl-n
map <leader>n :NERDTreeToggle<CR>

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_return               = "⇛"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1
map <leader>l :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
