
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

call plug#begin()

  " ###### Add git fugitive ######
  Plug 'tpope/vim-fugitive'

  " ######## Add Colorscheme ########
  Plug 'mhartington/oceanic-next'
  Plug 'morhetz/gruvbox'
  Plug 'chriskempson/base16-vim'
  Plug 'deviantfero/wpgtk.vim'
  Plug 'dylanaraps/wal.vim'
  
  " ####### Add auto compltetion coc nvim #######
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " ###### Add unicode && emoji ######
  Plug 'chrisbra/unicode.vim'

  " ###### Add commentary #######
  Plug 'tpope/vim-commentary'

  " ###### Programming Syntax ######
  Plug 'sheerun/vim-polyglot'
    "" Color highlighting
    Plug 'ap/vim-css-color'
    "" Javascript
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    "" Cpp

  " ###### Vim Airlines ######
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
  " ###### Move line ######
  Plug 'matze/vim-move'

  " ###### Indent Line #######
  Plug 'Yggdroot/indentLine'

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
let $curColor = "base16-harmonic-dark"

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
nnoremap <C-r> :so ~/.config/nvim/init.vim<CR>

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

nmap <leader>/ gcc
xmap <leader>/ gc

" ********************


" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Set up CoC for auto completion
" ------------------------------------------------------------------

" let g:coc_node_path = '/usr/bin/node'
" coc extensions
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver@1.4.9', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-lua']

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

set laststatus=2

let g:airline_powerline_fonts = 1

" let g:airline_theme='wpgtk'

" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" ------------------------------------------------------------------
" Customize my tabline
" ------------------------------------------------------------------

" set showtabline=2

" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0

let g:airline#extensions#tabline#formatter = 'unique_tail'

" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = '|'


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
" Set up highlighting
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



" help function for formatters
function! CopyDiffToBuffer(input, output, bufname)
  " prevent out of range in cickle
  let min_len=min([len(a:input), len(a:output)])

  " copy all lines, that was changed
  for i in range(0, min_len - 1)
    let output_line=a:output[i]
    let input_line=a:input[i]
    if input_line != output_line
      call setline(i + 1, output_line) " lines calculate from 1, items - from 0
    end
  endfor

  " in this case we have to handle all lines, that was in range
  if len(a:input) != len(a:output)
    if min_len == len(a:output) " remove all extra lines from input
      call deletebufline(a:bufname, min_len + 1, "$")
    else " append all extra lines from output
      call append("$", a:output[min_len:])
    end
  end
endfunction

function! LuaFormat()
  let input=getline(1, "$")

  " in case of some error formatter print to stderr error message and exit
  " with 0 code, so we need redirect stderr to file, for read message in case
  " of some error. So let create a temporary file
  let errorfile=tempname()

  let flags=" -si "

  " we can use config file for formatting which we have to set manually
  let config=findfile(".lua-format", ".;")
  if len(config) " append config file to flags
    let flags=flags . " -c " . config
  end

  let output_str=system("lua-format " . flags . " 2>" . errorfile, input)

  if len(output_str) " all right
    let output=split(output_str, "\n")
    call CopyDiffToBuffer(input, output, bufname("%"))

    " also clear lbuffer
    lexpr ""
    lwindow
  else " we got error
    let errors=readfile(errorfile)

    " insert filename of current buffer in front of list. Need for errorformat
    let sourcefile=expand("%")
    call insert(errors, sourcefile)

    set efm=%+P%f,line\ %l:%c\ %m,%-Q
    lexpr errors
    lwindow 5
  end

  call delete(errorfile)
endfunction
autocmd FileType lua nnoremap <buffer> <c-k> :call LuaFormat()<cr>
autocmd BufWrite *.lua call LuaFormat()
