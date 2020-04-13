
" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║     
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

if &compatible
  " Set compatibility to Vim only
  set nocompatible
endif

call plug#begin()

  " ###### Add git fugitive ######
  Plug 'tpope/vim-fugitive'

  " ######## Add colorscheme ########
  Plug 'mhartington/oceanic-next'
  Plug 'morhetz/gruvbox'
  Plug 'chriskempson/base16-vim'
  Plug 'deviantfero/wpgtk.vim'
  Plug 'dylanaraps/wal.vim'
  Plug 'rodnaph/vim-color-schemes'
  
  " ####### Add auto completion coc nvim #######
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " ###### Add unicode && emoji ######
  Plug 'chrisbra/unicode.vim'

  " ###### Add commentary #######
  Plug 'preservim/nerdcommenter'

  " ###### Programming Syntax ######
  Plug 'justinmk/vim-syntax-extra'
  Plug 'sheerun/vim-polyglot'
    "" Color highlighting
    Plug 'norcalli/nvim-colorizer.lua'
    "" Javascript
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    "" Cpp
    Plug 'bfrg/vim-cpp-modern'
    Plug 'octol/vim-cpp-enhanced-highlight'
    "" Rust
    Plug 'rust-lang/rust.vim'
    "" i3
    Plug 'PotatoesMaster/i3-vim-syntax'
    "" SXHKD
    Plug 'kovetskiy/sxhkd-vim'

  " ###### Vim Airlines ######
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  " Plug 'itchyny/lightline.vim'
  " Plug 'daviesjamie/vim-base16-lightline'

  " ###### Move line ######
  Plug 'matze/vim-move'

  " ###### Indent Line #######
  Plug 'Yggdroot/indentLine'
  
  " ###### Vim Undo Tree #######
  Plug 'simnalamburt/vim-mundo'

  " ###### Vim Navigator Tree #######
  " Plug 'tpope/vim-vinegar'

call plug#end()

" ------------------------------------------------------------------
" My normal vim set up
" ------------------------------------------------------------------

" For plug-ins to load correctly.
filetype plugin indent on

" Turn on syntax highlighting.
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" force 256 colors on the terminal
set t_Co=256
let $curColor = "base16-apathy"

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
  if $curColor != 'wpgtk' && $curColor != 'wpgtkAlt'
    set termguicolors
  endif
endif

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
" colorscheme $curColor
highlight LineNr ctermbg=NONE ctermfg=white guibg=NONE guifg=white
highlight SignColumn ctermbg=NONE guibg=NONE
highlight Comment cterm=italic gui=italic

set encoding=UTF-8

set number
set relativenumber
" Turn off number for text file
autocmd FileType text setl nonumber | setl norelativenumber


" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Add spell checker to vim
" set spell
" use tab completion instead of using <C-N> / <C-P>
" nmap <tab> viw<esc>a<c-x>s

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

" Use Ctrl to move line instead of using Alt
let g:move_key_modifier = 'C'

" restart vim after update
nnoremap <C-r> :so ~/.config/nvim/init.vim<CR><CR>

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

" ********************
" Add commentary to vim
" ********************

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
" let g:NERDToggleCheckAllLines = 1

nmap <leader>/ :call NERDComment(0,"toggle")<CR>
xmap <leader>/ :call NERDComment(0,"toggle")<CR>

" ********************


" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Set up CoC for auto completion
" ------------------------------------------------------------------

" let g:coc_node_path = '/usr/bin/node'
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-lua', 'coc-cmake', 'coc-spell-checker', 'coc-actions', 'coc-rls']

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

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

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

set laststatus=2

" function! GitBranch()
"   return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
" endfunction

" function! StatuslineGit()
"   let l:branchname = GitBranch()
"   return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
" endfunction

" set statusline=
" set statusline+=%#PmenuSel#
" set statusline+=%{StatuslineGit()}
" set statusline+=%#LineNr#
" set statusline+=\ %f
" " set statusline+=%m\
" set statusline+=%=
" " set statusline+=%#CursorColumn#
" set statusline+=\ %y
" set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
" set statusline+=\[%{&fileformat}\]
" set statusline+=\ %p%%
" set statusline+=\ %l:%c
" " set statusline+=\

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Customize my tabline
" ------------------------------------------------------------------

" set showtabline=2

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
  startinsert ""

  " Hook up TermClose event to close both terminal and border windows
  autocmd TermClose * ++once :q | call nvim_win_close(s:border_win, v:true)
endfunction

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Set up syntax highlighting
" ------------------------------------------------------------------

  "" #############
  "" Javascript
  "" #############
    au BufNewFile,BufRead *.jsx setlocal ft=html ft=javascript
    " The following variables control certain syntax highlighting plugins.
    " You can add them to your .vimrc to enable their features.
    let g:javascript_plugin_jsdoc = 1
    " highlight close tag
    let g:vim_jsx_pretty_highlight_close_tag = 1
    " turn on colorful config
    let g:vim_jsx_pretty_colorful_config = 1

    set conceallevel=1
  "" ~~~~~~~~~~~~~

  "" #############
  "" Cpp
  "" #############
  " Enable highlighting of named requirements (C++20 library concepts)
  let g:cpp_named_requirements_highlight = 1
  
  let c_no_curly_error = 1

  " Highlighting of class scope is disabled by default. To enable set
  let g:cpp_class_scope_highlight = 1

  " Highlighting of member variables is disabled by default. To enable set
  let g:cpp_member_variable_highlight = 1

  " Highlighting of class names in declarations is disabled by default. To enable set
  let g:cpp_class_decl_highlight = 1
  "" ~~~~~~~~~~~~~

  "" #############
  "" Rust
  "" #############
  let g:rust_recommended_style = 0
  "" ~~~~~~~~~~~~~

  "" #############
  "" Colorizer
  "" #############
  lua require 'colorizer'.setup({'*'}, { mode = "background"; css = true; css_fn = true })
  "" ~~~~~~~~~~~~~

  "" #############
  "" Indent Line
  "" #############
    " Term
    let g:indentLine_color_term = 239

  " Gui
    let g:indentLine_color_gui = '#4e4e4e'

    let g:indentLine_char = ''
    " let g:indentLine_leadingSpaceEnabled = 1
    let g:indentLine_leadingSpaceChar = '•'
  "" ~~~~~~~~~~~~~

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Set up mundo, vim undo tree
" ------------------------------------------------------------------

  nnoremap <C-u> :MundoToggle<CR>
  " Enable persistent undo so that undo history persists across vim sessions
  set undofile
  set undodir=~/.vim/undo

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
