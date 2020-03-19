set laststatus=2

" ********************
" COLOR
" ********************
hi StatusLine          guifg=#282828 guibg=#98971a 
hi StatusLineNC        guifg=#282828 guibg=#98971a

hi mystatuslineseparator guifg=#3c3836 guibg=None    

hi MyStatuslineModified guifg=#3c3836 guibg=None
hi MyStatuslineModifiedBody guifg=#d79921 guibg=#3c3836

hi MyStatuslineReadOnly guifg=#3c3836 guibg=None
hi MyStatuslineReadOnlyBody guifg=#d79921 guibg=#3c3836

hi MyStatuslineFiletype guifg=#3c3836 guibg=None    
hi MyStatuslineFiletypeBody ctermfg=5 cterm=italic ctermbg=0  guifg=#689d6a guibg=#3c3836  gui=italic

hi MyStatuslinePercentageBody guifg=#d65d0e guibg=#3c3836
hi MyStatuslinePercentage guibg=None guifg=#3c3836

hi MyStatuslineLineCol ctermfg=0 cterm=NONE ctermbg=NONE guifg=#3c3836 guibg=None    
hi MyStatuslineLineColBody ctermbg=0 cterm=none ctermfg=2  guifg=#458588 guibg=#3c3836

" switch color when switch vim mode
function! RedrawModeColors(mode)
  " Normal mode
  if a:mode == 'n'
    hi MyStatuslineAccent  guifg=#3c3836 gui=bold
    hi MyStatuslineFilename guifg=#bdae93 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#bdae93  guibg=#3c3836     
  " Insert mode
  elseif a:mode == 'i'
    hi MyStatuslineAccent  guifg=#3c3836 
    hi MyStatuslineFilename guifg=#83a598 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#83a598  guibg=#3c3836    
  " Replace mode
  elseif a:mode == 'R'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#fb4934 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#fb4934  guibg=#3c3836    
  " Visual mode
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#d65d0e guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#d65d0e  guibg=#3c3836    
  " Command mode
  elseif a:mode == 'c'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#d79921 guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#d79921  guibg=#3c3836    
  " Terminal mode
  elseif a:mode == 't'
    hi MyStatuslineAccent guifg=#3c3836 
    hi MyStatuslineFilename guifg=#98971a guibg=#3c3836    
    hi MyStatuslineAccentBody guifg=#98971a  guibg=#3c3836    
  endif
  " Return empty string so as not to display anything in the statusline
  return ''
endfunction

" ********************
" MODIFIED
" ********************
function! Modified() 
  if &modified
    return ''
  else
    return ''
endfunction

" ********************
" READONLY
" ********************
function! ReadOnly()
	if &readonly || !&modifiable
		return ''
	else
		return ''
	endif
endfunction


" ********************
" SYNTAX ITEM
" ********************
function! SyntaxItem()
	let l:syntaxname = synIDattr(synID(line("."),col("."),1),"name")

	if l:syntaxname != ""
		return l:syntaxname
	else
		return ""
	endif
endfunction
                                                              

function! ActiveStatusLine()
  let l:statusline=""

  let l:statusline.="%{RedrawModeColors(mode())}"

  " Left side
  " =======================
  let l:statusline.="%#MyStatuslineAccent#\ "
  let l:statusline.="%#MyStatuslineAccentBody#\" 
  " Filename
  let l:statusline.="%#MyStatuslineFilename#%t"
  let l:statusline.="%#MyStatuslineSeparator#\ "

  " Show if file has been modified
	if Modified() != ""
		let l:statusline.="%#MyStatuslineModified#\"
    " Modified
    let l:statusline.="%#MyStatuslineModifiedBody#\%{Modified()}"
    let l:statusline.="%#MyStatuslineModified#\ "
	endif

  " Show if file is readonly file
	if ReadOnly() != ""
		let l:statusline.="%#MyStatuslineReadOnly#\"
    " Modified
    let l:statusline.="%#MyStatuslineReadOnlyBody#\%{ReadOnly()}"
    let l:statusline.="%#MyStatuslineReadOnly#\ "
	endif

  " Right side items
  " =======================
	let l:statusline.="%="
  " Line and Column
  let l:statusline.="%#MyStatuslineLineCol#"
  let l:statusline.="%#MyStatuslineLineColBody#%2l"
  let l:statusline.="\/%#MyStatuslineLineColBody#%2c"
  let l:statusline.="%#MyStatuslineLineCol#"
  " Padding
 let l:statusline.="\ "  
  " Current scroll percentage and total lines of the file
  let l:statusline.="%#MyStatuslinePercentage#"
  let l:statusline.="%#MyStatuslinePercentageBody#%P"
  let l:statusline.="\/\%#MyStatuslinePercentageBody#%L"
  let l:statusline.="%#MyStatuslinePercentage#"
  " Padding
  let l:statusline.="\ "  
  " Filetype
  " let l:statusline.="%#MyStatuslineFiletype#"
  " let l:statusline.="%#MyStatuslineFiletypeBody#%{SetFiletype(&filetype)}"
  " let l:statusline.="%#MyStatuslineFiletype#\ "

  return l:statusline
endfunction

function! InActiveStatusLine()
  let l:statusline=""

  let l:statusline.="%{RedrawModeColors(mode())}"

  " Left side
  " =======================
  let l:statusline.="%#MyStatuslineAccent#\ "
  let l:statusline.="%#MyStatuslineAccentBody#\" 
  " Filename
  let l:statusline.="%#MyStatuslineFilename#%f"
  let l:statusline.="%#MyStatuslineSeparator#\ "

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

 
