" ********************
" BATTERY LEVEL
" ********************

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
	" let l:statusline.="%1*\ "
	" Show battery level
	" let l:statusline.="%6*\ %{g:battery_level}\ "
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

" call SetBatteryLevel(0)


