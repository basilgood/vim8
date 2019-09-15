"""" simple colorscheme
"""" colors from gruvbox-material and simplified

set background=dark

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name='simple'

highlight Normal         guifg=#dfbf8e guibg=#1d2021 gui=NONE      cterm=NONE
highlight EndOfBuffer    guifg=#1d2021 guibg=#1d2021 guisp=NONE    gui=NONE        cterm=NONE
highlight Terminal       guifg=#ebdbb2 guibg=#1d2021 gui=NONE      cterm=NONE
highlight NonText        guifg=#5c6370 guibg=NONE    gui=NONE      cterm=NONE
highlight SpecialKey     guifg=#5c6370 guibg=NONE    gui=NONE      cterm=NONE
highlight Comment        guifg=#928374 guibg=NONE    guisp=NONE    gui=italic      cterm=italic
highlight SpecialComment guifg=#928374 guibg=NONE    guisp=NONE    gui=italic      cterm=italic
highlight Conceal        guifg=#ebdbb2 guibg=NONE    gui=NONE      cterm=NONE
highlight Constant       guifg=#d3869b guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Statement      guifg=#ea6962 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Typedef        guifg=#e3a84e guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Type           guifg=#e3a84e guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Identifier     guifg=#7daea3 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Ignore         guifg=#dfbf8e guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight String         guifg=#a9b665 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Title          guifg=#a9b665 guibg=NONE    guisp=NONE    gui=bold        cterm=bold
highlight Include        guifg=#89b482 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Conditional    guifg=#ea6962 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Special        guifg=#e78a4e guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight PreProc        guifg=#89b482 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Directory      guifg=#a9b665 guibg=NONE    gui=NONE      cterm=NONE
highlight Todo           guifg=#928374 guibg=NONE    guisp=NONE    gui=bold,italic cterm=bold,italic
highlight Underlined     guifg=#7daea3 guibg=NONE    guisp=NONE    gui=underline   cterm=underline
highlight Function       guifg=#a9b665 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight StorageClass   guifg=#e78a4e guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Structure      guifg=#89b482 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight SignColumn     guifg=NONE    guibg=#1d2021 guisp=NONE    gui=NONE        cterm=NONE
highlight FoldColumn     guifg=NONE    guibg=#3c3836 guisp=NONE    gui=NONE        cterm=NONE
highlight Folded         guifg=NONE    guibg=#3c3836 guisp=NONE    gui=NONE        cterm=NONE
highlight QuickFixLine   guifg=#d9d1af guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE

highlight Cursor         guifg=#000000 guibg=#99ff99 gui=NONE      cterm=NONE
highlight CursorLine     guifg=NONE    guibg=#323232 gui=NONE      cterm=NONE
highlight CursorLineNr   guifg=#83a598 guibg=NONE    gui=NONE      cterm=NONE
highlight CursorColumn   guifg=NONE    guibg=#333333 gui=NONE      cterm=NONE
highlight ColorColumn    guifg=NONE    guibg=#333333 gui=NONE      cterm=NONE
highlight LineNr         guifg=#484848 guibg=#1d2021 guisp=NONE    gui=NONE        cterm=NONE
highlight CursorIM       guifg=#000000 guibg=#cc9999 gui=NONE      cterm=NONE
highlight MatchParen     guifg=#fade3e guibg=NONE    gui=underline cterm=underline

highlight Search         guifg=#ebdbb2 guibg=#574c74 gui=bold
highlight IncSearch      guifg=#d9d1af guibg=#b0507c gui=NONE      cterm=NONE

highlight FoldColumn     guifg=#555555 guibg=#111111 gui=NONE      cterm=NONE
highlight Folded         guifg=#999999 guibg=#111111 gui=NONE      cterm=NONE

highlight ErrorMsg       guifg=#ea6962 guibg=NONE    guisp=NONE    gui=bold        cterm=bold
highlight WarningMsg     guifg=#e3a84e guibg=NONE    guisp=NONE    gui=bold        cterm=bold
highlight ModeMsg        guifg=#1d2021 guibg=#a89984 guisp=NONE    gui=bold        cterm=bold
highlight MoreMsg        guifg=#e3a84e guibg=NONE    guisp=NONE    gui=bold        cterm=bold
highlight Question       guifg=#e78a4e guibg=NONE    guisp=NONE    gui=bold        cterm=bold
highlight Exception      guifg=#A6E22E gui=bold

highlight SpellBad       ctermbg=95 ctermfg=252 gui=undercurl guisp=#e27878
highlight SpellCap       ctermbg=24 ctermfg=252 gui=undercurl guisp=#84a0c6
highlight SpellLocal     ctermbg=23 ctermfg=252 gui=undercurl guisp=#89b8c2
highlight SpellRare      ctermbg=97 ctermfg=252 gui=undercurl guisp=#a093c7

highlight Visual         guifg=NONE    guibg=#405260 gui=NONE      cterm=NONE
highlight VisualNOS      guifg=NONE    guibg=#4d6b67 gui=NONE      cterm=NONE

highlight StatusLine     guifg=#1d1d1d guibg=#777777 gui=bold      cterm=bold
highlight StatusLineNC   guifg=#999999 guibg=#444444 gui=NONE      cterm=NONE
highlight WildMenu       guifg=#282828 guibg=#c9d05c gui=NONE      cterm=NONE
highlight VertSplit      guifg=#333333 guibg=#333333 gui=NONE      cterm=NONE

highlight Pmenu          guifg=#dfbf8e guibg=#504945 guisp=NONE    gui=NONE        cterm=NONE
highlight PmenuSbar      guifg=NONE    guibg=#504945 guisp=NONE    gui=NONE        cterm=NONE
highlight PmenuSel       guifg=#1d2021 guibg=#a89984 guisp=NONE    gui=NONE        cterm=NONE
highlight PmenuThumb     guifg=NONE    guibg=#7c6f64 guisp=NONE    gui=NONE        cterm=NONE

highlight TabLine        guifg=#999999 guibg=#444444 gui=NONE      cterm=NONE
highlight TabLineFill    guifg=NONE    guibg=#444444 gui=NONE      cterm=NONE
highlight TabLineSel     guifg=#c9d05c guibg=NONE    gui=NONE      cterm=NONE

hi diffAdded guifg=#a9b665 gui=NONE ctermfg=46  cterm=NONE
hi diffRemoved guifg=#ea6962 gui=NONE ctermfg=203 cterm=NONE
hi link diffSubname Normal
hi DiffAdd guifg=#8ec07c guibg=#1d2021 cterm=NONE
hi link DiffChange NONE
hi clear DiffChange
hi DiffDelete guifg=#f93d3d guibg=#1d2021 cterm=NONE
hi DiffText guifg=#FFB86C guibg=#14141a gui=NONE cterm=NONE

" ALE lint
highlight ALEWarningSign guifg=#fabd2f guibg=#1d2021 gui=NONE cterm=NONE
highlight ALEErrorSign   guifg=#f93d3d guibg=#1d2021 gui=NONE cterm=NONE

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
