hi clear
set background=dark
if exists("syntax_on") 
	syntax reset
endif
let g:colors_name = "walgui"


hi Normal                 guifg=#ffffff guibg=#000000
hi User1                  gui=none  guibg=#008080    guifg=#ffffff
hi User2				  gui=none  guibg=8    guifg=#ffffff
hi Title                  gui=none  guibg=none guifg=DarkGrey
hi TabLineFill            gui=none  guibg=8    guifg=#ffffff
hi TabLine                gui=none  guibg=8    guifg=#ffffff
hi TabLineSel             gui=none  guibg=#00ffff   guifg=#000000
hi StatusLine             gui=none  guibg=#00ffff   guifg=#000000
hi StatusLineNC           gui=none  guibg=8    guifg=#ffffff
hi StatusLineTerm         gui=none  guifg=#0000ff   guifg=#000000
hi StatusLineTermNC       gui=none  guibg=8    guifg=#ffffff
hi CursorLine             guibg=#000000   gui=none
hi Visual                 guibg=#00ffff  guifg=#000000    gui=none
hi CursorLineNr           guifg=#ffffff guibg=6
hi LineNr                 guifg=7  guibg=8
hi VertSplit              guifg=#000000   guibg=8    gui=none
hi Specialkey             guifg=#ff00ff  guibg=#000000
hi ErrorMsg               guifg=#000000   guibg=9
hi Pmenu                  guibg=8   guifg=#ffffff
hi PmenuSel               guibg=#00ffff  guifg=#000000
hi SpellBad               guifg=8   guibg=9    term=none
hi Comment                guifg=4   guibg=#000000    gui=italic gui=italic
hi MatchParen             guifg=#0000ff  guibg=8   gui=none
hi DiffAdd				  guifg=#000000
hi DiffDelete			  guifg=#000000
hi DiffText				  guifg=#000000
hi DiffChange			  guifg=#000000
hi YCMWarningSection      guifg=#000000  guibg=4
hi Special                guifg=9
hi WarningMsg             guifg=#00ff00
hi MoreMsg                guifg=#ffffff
hi Directory              guifg=#ffff00
hi Folded                 guifg=#ffffff  guibg=8
hi Underlined             term=underline guifg=#0000ff

highlight Constant   gui=none      guifg=#ffff00   guifg=#ffa0a0
"highlight Number   	 term=underline guifg=DarkGrey                     guifg=Yellow
highlight Identifier guifg=#0000ff       gui=none guifg=#40ffff
highlight Statement  guifg=#00ff00  gui=bold  guifg=#ffff60
highlight Keyword    guifg=#ff00ff
highlight Conditional guifg=#ffff00
highlight Number     guifg=#0000ff
highlight PreProc    guifg=#00ff00      guifg=#ff4500
highlight Type       guifg=#ff00ff       gui=italic term=none 
highlight Ignore     guifg=#000000       guifg=bg
highlight Error      guifg=#000000       guibg=1 guifg=White guibg=Red
highlight Todo       guifg=#ffffff      guibg=8 guifg=Blue  guibg=Yellow
highlight SignColumn guibg=8       guifg=#0000ff

" Change the highlight of search matches (for use with :set hls).
highlight Search                    guifg=#000000      guibg=#0000ff  guifg=Black    guibg=Yellow

" Change the highlight of visual highlight.

highlight Float          guifg=#00ffff  guifg=#88AAEE
highlight Exception      guifg=#00ff00 guibg=#000000 guifg=Red   guibg=White
highlight Function       guifg=#00ffff
highlight Typedef        guifg=#00ff00  guibg=8   gui=italic  guifg=White guibg=Blue
highlight SpecialChar    guifg=#0000ff guibg=8   guifg=Black guibg=White
highlight Delimiter      guifg=#ffffff guibg=8   guifg=White guibg=Black
highlight SpecialComment guifg=#ffff00 guibg=8   guifg=Black guibg=Green

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi! link Question Type
hi! link FoldColumn Folded

highlight link Special        Type
highlight link String         Constant
highlight link Character      Constant
highlight link Boolean        Statement
highlight link Repeat         Conditional
highlight link Label          Type
highlight link Operator       Type
highlight link Include        PreProc
highlight link Define         PreProc
highlight link Macro          PreProc
highlight link PreCondit      PreProc
highlight link StorageClass   Type
highlight link Structure      Type
highlight link Tag            Special
highlight link Debug          Special
highlight link Typedef        Type

"highlight link SpecialChar     Special
"highlight link Delimiter       Special
"highlight link SpecialComment  Special
"highlight link Exception       Type
