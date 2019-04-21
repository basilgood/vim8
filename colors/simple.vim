"""" simple colorscheme

set background=dark

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name='simple'

highlight Normal         guifg=#ebdbb2 guibg=#1d2021 gui=NONE cterm=NONE
highlight Terminal       guifg=#ebdbb2 guibg=#1d2021 gui=NONE cterm=NONE
highlight NonText        guifg=#5c6370 guibg=NONE    gui=NONE cterm=NONE
highlight SpecialKey     guifg=#5c6370 guibg=NONE    gui=NONE cterm=NONE
highlight Comment        guifg=#5c6370 guibg=NONE    gui=italic cterm=italic
highlight Conceal        guifg=#ebdbb2 guibg=NONE    gui=NONE cterm=NONE
highlight Constant       guifg=#d3869b guibg=NONE    gui=NONE cterm=NONE
highlight Statement      guifg=#fb4934 guibg=NONE    gui=NONE cterm=NONE
highlight Type           guifg=#fabd2f guibg=NONE    gui=NONE cterm=NONE
highlight Identifier     guifg=#83a598 guibg=NONE    gui=NONE  | " lightgreen
highlight Ignore         guifg=NONE    guibg=NONE    gui=NONE cterm=NONE
highlight String         guifg=#8ec07c guibg=NONE    gui=NONE cterm=NONE
highlight Title          guifg=#8ec07c guibg=NONE    gui=NONE cterm=NONE | " green
highlight Include        guifg=#61afef guibg=NONE    gui=NONE cterm=NONE
highlight Conditional    guifg=#fb4934 guibg=NONE    gui=NONE cterm=NONE  | " orange
highlight Special        guifg=#fb4934 guibg=NONE    gui=NONE cterm=NONE  | " orange
highlight PreProc        guifg=#fabd2f guibg=NONE    gui=NONE cterm=NONE  | " yellow
highlight Directory      guifg=#b3deef guibg=NONE    gui=NONE cterm=NONE
highlight Todo           guibg=NONE    guifg=NONE    gui=reverse cterm=reverse
highlight Underlined     guifg=#5f8787 guibg=NONE    gui=underline ctermbg=NONE ctermfg=NONE cterm=underline
highlight Function       guifg=#8ec07c guibg=NONE    gui=NONE cterm=NONE
highlight StorageClass   guifg=#8ec07c guibg=NONE    gui=NONE cterm=NONE
highlight Structure      guifg=#8ec07c guibg=NONE    gui=NONE cterm=NONE
highlight Typedef        guifg=#8ec07c guibg=NONE    gui=NONE cterm=NONE
highlight SignColumn     guifg=#555555 guibg=#111111 gui=NONE cterm=NONE
highlight FoldColumn     guifg=#555555 guibg=#111111 gui=NONE cterm=NONE
highlight Folded         guifg=#555555 guibg=#111111 gui=NONE cterm=NONE
highlight QuickFixLine   guifg=#fb4934 guibg=NONE

highlight Cursor         guifg=#000000 guibg=#99ff99 gui=NONE cterm=NONE
highlight CursorLine     guifg=NONE    guibg=#333333 gui=NONE cterm=NONE
highlight CursorLineNr   guifg=#83a598 guibg=NONE    gui=NONE cterm=NONE
highlight CursorColumn   guifg=NONE    guibg=#333333 gui=NONE cterm=NONE
highlight ColorColumn    guifg=NONE    guibg=#333333 gui=NONE cterm=NONE
highlight LineNr         guifg=#555555 guibg=#111111 gui=NONE ctermfg=238 ctermbg=NONE
highlight CursorIM       guifg=#000000 guibg=#cc9999 gui=NONE cterm=NONE
highlight MatchParen     guifg=#fade3e guibg=NONE    gui=underline cterm=underline

highlight IncSearch      guifg=#1d2021 guibg=#fb4934 gui=NONE cterm=NONE
highlight Search         guifg=#282828 guibg=#8ec07c gui=bold

highlight FoldColumn     guifg=#555555 guibg=#111111 gui=NONE cterm=NONE
highlight Folded         guifg=#999999 guibg=#111111 gui=NONE cterm=NONE

highlight ErrorMsg       guifg=#1d2021 guibg=#af5f5f gui=NONE cterm=NONE
highlight ModeMsg        guifg=#1d2021 guibg=#87af87 gui=NONE cterm=NONE
highlight MoreMsg        guifg=#5f8787 guibg=NONE    gui=NONE cterm=NONE
highlight Question       guifg=#66ff33 guibg=NONE    gui=NONE cterm=NONE
highlight WarningMsg     guifg=#af5f5f guibg=NONE    gui=NONE cterm=NONE
highlight Exception      guifg=#A6E22E               gui=bold

highlight Visual         guifg=NONE    guibg=#403D3D gui=NONE cterm=NONE
highlight VisualNOS      guifg=NONE    guibg=#403D3D gui=NONE cterm=NONE

highlight StatusLine     guifg=#1d1d1d guibg=#777777 gui=bold cterm=bold
highlight StatusLineNC   guifg=#999999 guibg=#444444 gui=NONE cterm=NONE
highlight WildMenu       guifg=#282828 guibg=#c9d05c gui=NONE cterm=NONE
highlight VertSplit      guifg=#333333 guibg=#333333 gui=NONE cterm=NONE

highlight Pmenu          guifg=#ebdbb2 guibg=#444444 gui=NONE cterm=NONE
highlight PmenuSel       guifg=#1d2021 guibg=#83a598 gui=NONE cterm=NONE
highlight PmenuSbar      guifg=NONE    guibg=#8ec07c gui=NONE cterm=NONE
highlight PmenuThumb     guifg=#ffc24b guibg=#8ec07c gui=NONE cterm=NONE

highlight TabLine        guifg=#999999 guibg=#444444 gui=NONE cterm=NONE
highlight TabLineFill    guifg=NONE    guibg=#444444 gui=NONE cterm=NONE
highlight TabLineSel     guifg=#c9d05c guibg=NONE    gui=NONE cterm=NONE

highlight DiffAdd        guifg=#8ec07c guibg=#1d2021 cterm=reverse
highlight DiffChange     guifg=#fabd2f guibg=#1d2021 cterm=reverse
highlight DiffDelete     guifg=#f93d3d guibg=#1d2021 cterm=reverse
highlight DiffText       guifg=#56b6c2 guibg=#1d2021 cterm=reverse

" ALE lint
highlight ALEWarningSign guifg=#fabd2f guibg=#111111 gui=NONE cterm=NONE
highlight ALEErrorSign   guifg=#f93d3d guibg=#111111 gui=NONE cterm=NONE

" ParenMatch
highlight ParenMatch term=underline cterm=underline gui=underline

hi link Boolean Constant
hi link Character Constant
hi link Conditional Statement
hi link Debug Special
hi link Define PreProc
hi link Delimiter Special
hi link Exception Statement
hi link Float Number
hi link HelpCommand Statement
hi link HelpExample Statement
hi link Include PreProc
hi link Keyword Statement
hi link Label Statement
hi link Macro PreProc
hi link Number Constant
hi link Operator Statement
hi link PreCondit PreProc
hi link Repeat Statement
hi link SpecialChar Special
hi link SpecialComment Special
hi link StorageClass Type
hi link Structure Type
hi link Tag Special
hi link Terminal Normal
hi link Typedef Type
hi link htmlEndTag htmlTagName
hi link htmlLink Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag htmlTagName
hi link htmlBold Normal
hi link htmlItalic Normal
hi link xmlTag Statement
hi link xmlTagName Statement
hi link xmlEndTag Statement
hi link markdownItalic Preproc
hi link asciidocQuotedEmphasized Preproc
hi link diffBDiffer WarningMsg
hi link diffCommon WarningMsg
hi link diffDiffer WarningMsg
hi link diffIdentical WarningMsg
hi link diffIsA WarningMsg
hi link diffNoEOL WarningMsg
hi link diffOnly WarningMsg
hi link diffRemoved WarningMsg
hi link diffAdded String
