
" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║     
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

if &compatible
  " Set compativility to Vim only
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " ######## Add Colorscheme ########
  call dein#add('mhartington/oceanic-next')
  
  " ####### Add auto compltetion coc nvim #######
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

  " ###### Add vim lightline and component ######
  call dein#add('lambdalisue/battery.vim')
  
  call dein#end()
  call dein#save_state()
endif


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
let $curColor = "OceanicNext"
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
colorscheme $curColor

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

" Enable mouse support
set mouse=a
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

nnoremap <C-t> :call OpenFloatTerm()<CR>

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Set up CoC for auto completion
" ------------------------------------------------------------------

" let g:coc_node_path = '/usr/bin/node'
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver@1.4.9', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

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
nnoremap <silent> space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


" ------------------------------------------------------------------
" Customize my statusline
" ------------------------------------------------------------------

let g:battery_level = system('acpi | grep -oP "(\d+)%" | tr -d "\n"')
function! SetBatteryLevel(timer_id)
  let l:battery_level = system('acpi | grep -oP "(\d+)%" | tr -d "\n"')
  if (battery_level != '')
    let g:battery_level = l:battery_level
    redraw!
  endif
  call timer_start(30000, 'SetBatteryLevel')
endfunction

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
	elseif (mode() =~# '\v(v|V|^V)')
		let l:statusline.="%2*"
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
	" Separator
	let l:statusline.="%1*\ "
	" Filename
	let l:statusline.="%1*\ "
	" Separator
	let l:statusline.="%1*\ "
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
	" Filename
	let l:statusline.="%6*\ %{g:battery_level}\ "
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
if $curColor ==? 'nord'
	hi User2 ctermbg=white  ctermfg=black guibg=#d8dee9 guifg=#2e3440
	hi User3 ctermbg=white  ctermfg=black guibg=#d8dee9 guifg=#2e3440
	hi User4 ctermbg=white  ctermfg=black guibg=#d8dee9 guifg=#2e3440
	hi User5 ctermbg=cyan  ctermfg=black guibg=#81a1c1 guifg=#2e3440
	hi User6 ctermbg=red  ctermfg=white guibg=#bf616a guifg=#d8dee9
	hi User7 ctermbg=178  ctermfg=white guibg=#d08770 guifg=#d8dee9
	hi User8 ctermbg=blue  ctermfg=green guibg=#88c0d0 guifg=#2e3440
elseif $curColor ==? 'OceanicNext'
	hi User2 ctermbg=white  ctermfg=black guibg=#fac863 guifg=#2e3440
	hi User3 ctermbg=white  ctermfg=black guibg=#d8dee9 guifg=#1b2b34
	hi User4 ctermbg=white  ctermfg=black guibg=#d8dee9 guifg=#1b2b34
	hi User5 ctermbg=cyan  ctermfg=black guibg=#6699cc guifg=#d8dee9
	hi User6 ctermbg=red  ctermfg=white guibg=#ec5f67 guifg=#d8dee9
	hi User7 ctermbg=178  ctermfg=white guibg=#99c794 guifg=#1b2b34
	hi User8 ctermbg=blue  ctermfg=green guibg=#5fb3b3 guifg=#1b2b34
else
	hi User2 ctermbg=white  ctermfg=black guibg=#d8dee9 guifg=#2e3440
	hi User3 ctermbg=white  ctermfg=black guibg=#d8dee9 guifg=#2e3440
	hi User4 ctermbg=white  ctermfg=black guibg=#d8dee9 guifg=#2e3440
	hi User5 ctermbg=cyan  ctermfg=black guibg=#81a1c1 guifg=#2e3440
	hi User6 ctermbg=red  ctermfg=white guibg=#bf616a guifg=#d8dee9
	hi User7 ctermbg=178  ctermfg=white guibg=#d08770 guifg=#d8dee9
	hi User8 ctermbg=blue  ctermfg=green guibg=#88c0d0 guifg=#2e3440
endif

call SetBatteryLevel(0)

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Customize my tabline
" ------------------------------------------------------------------

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

let g:battery#update_tabline = 1    " For tabline.

let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close', 'battery'] ]
  \ }

set tabline+=%{battery#component()}

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

