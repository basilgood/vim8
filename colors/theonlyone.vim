" after apprentice layout and onedark colours

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'theonlyone'

set background=dark

hi Normal           guifg=#abb2bf guibg=#21252c gui=NONE cterm=NONE
hi Terminal         guifg=#ebdbb2 guibg=#1d2021 gui=NONE cterm=NONE
hi LineNr           guifg=#5c5c5c guibg=#14171c gui=NONE
hi FoldColumn       guifg=#5c5c5c guibg=#14171c gui=NONE
hi Folded           guifg=#5c5c5c guibg=#14171c gui=NONE
hi MatchParen       guifg=#e91e63 guibg=NONE    gui=underline ctermfg=197 ctermbg=NONE cterm=underline
hi SignColumn       guifg=#6c6c6c guibg=#14171c gui=NONE

hi Comment          guifg=#5c6370 guibg=NONE    gui=italic cterm=italic
hi Conceal          guifg=#ebdbb2 guibg=NONE    gui=NONE cterm=NONE
hi Constant         guifg=#56b6c2 guibg=NONE    gui=NONE cterm=NONE
hi Error            guifg=#af5f5f guibg=NONE    gui=reverse
hi Identifier       guifg=#E06C75 guibg=NONE    gui=NONE
hi Ignore           guifg=NONE    guibg=NONE    gui=NONE cterm=NONE
hi PreProc          guifg=#E06C75 guibg=NONE    gui=NONE cterm=NONE
hi Special          guifg=#61afef guibg=NONE    gui=NONE cterm=NONE
hi Statement        guifg=#C678DD guibg=NONE    gui=NONE cterm=NONE
hi String           guifg=#98C379 guibg=NONE    gui=NONE cterm=NONE
hi Todo             guifg=NONE    guibg=NONE    gui=reverse cterm=reverse
hi Type             guifg=#E5C07B guibg=NONE    gui=NONE cterm=NONE
hi Underlined       guifg=NONE    guibg=NONE    gui=underline ctermbg=NONE ctermfg=NONE cterm=underline
hi Label            guifg=#E06C75 guibg=NONE    gui=NONE cterm=NONE

hi NonText          guifg=#3b4048 guibg=NONE    gui=NONE cterm=NONE

hi Pmenu            guibg=#444444 guifg=#bcbcbc gui=NONE
hi PmenuSbar        guibg=#585858 guifg=NONE    gui=NONE
hi PmenuSel         guibg=#5f8787 guifg=#262626 gui=NONE
hi PmenuThumb       guibg=#5f8787 guifg=#5f8787 gui=NONE

hi ErrorMsg         guifg=#1d2021 guibg=#af5f5f gui=NONE cterm=NONE
hi ModeMsg          guifg=#1d2021 guibg=#87af87 gui=NONE cterm=NONE
hi MoreMsg          guifg=#5f8787 guibg=NONE    gui=NONE cterm=NONE
hi Question         guifg=#66ff33 guibg=NONE    gui=NONE cterm=NONE
hi WarningMsg       guifg=#af5f5f guibg=NONE    gui=NONE cterm=NONE
hi Exception        guifg=#A6E22E               gui=bold

hi TabLine          guifg=#999999 guibg=#444444 gui=NONE cterm=NONE
hi TabLineFill      guifg=NONE    guibg=#444444 gui=NONE cterm=NONE
hi TabLineSel       guifg=#c9d05c guibg=NONE    gui=NONE cterm=NONE

hi Cursor           guifg=#000000 guibg=#99ff99 gui=NONE cterm=NONE
hi CursorLine       guifg=NONE    guibg=#2a303b gui=NONE cterm=NONE
hi CursorLineNr     guifg=#83a598 guibg=NONE    gui=NONE cterm=NONE
hi CursorColumn     guifg=NONE    guibg=#2a303b gui=NONE cterm=NONE

hi helpLeadBlank    guibg=NONE    guifg=NONE    gui=NONE
hi helpNormal       guibg=NONE    guifg=NONE    gui=NONE

hi StatusLine       guifg=#14171c guibg=#777777 gui=bold cterm=bold
hi StatusLineNC     guifg=#999999 guibg=#444444 gui=NONE cterm=NONE

hi StatusLineTerm   guibg=#87875f guifg=#262626 gui=NONE
hi StatusLineTermNC guibg=#444444 guifg=#87875f gui=NONE

hi Visual           guifg=NONE    guibg=#3b4351 gui=NONE cterm=NONE
hi VisualNOS        guifg=NONE    guibg=#3b4351 gui=NONE cterm=NONE

hi WildMenu         guifg=#282828 guibg=#c9d05c gui=NONE cterm=NONE
hi VertSplit        guifg=#333333 guibg=#333333 gui=NONE cterm=NONE

hi Function         guifg=#61AFEF guibg=NONE    gui=NONE cterm=NONE
hi SpecialKey       guifg=#3b4048 guibg=NONE    gui=NONE cterm=NONE
hi Title            guifg=#98c379 guibg=NONE    gui=NONE cterm=NONE

hi DiffAdd          guifg=#8ec07c guibg=#1d2021 cterm=NONE
hi link DiffChange NONE
hi clear DiffChange
hi DiffDelete       guifg=#f93d3d guibg=#1d2021 cterm=NONE
hi DiffText         guifg=#FFB86C guibg=#14141a gui=NONE cterm=NONE

hi IncSearch        guifg=#1d2021 guibg=#fb4934 gui=NONE cterm=NONE
hi Search           guifg=NONE    guibg=#111111 gui=bold cterm=bold

hi Directory        guifg=#61AFEF guibg=NONE    gui=NONE cterm=NONE

hi debugPC          guibg=#5f87af
hi debugBreakpoint  guibg=#af5f5f

hi SpellBad         guibg=NONE    guifg=#af5f5f gui=undercurl guisp=NONE
hi SpellCap         guibg=NONE    guifg=#5fafaf gui=undercurl guisp=NONE
hi SpellLocal       guibg=NONE    guifg=#5f875f gui=undercurl guisp=NONE
hi SpellRare        guibg=NONE    guifg=#ff8700 gui=undercurl guisp=NONE

hi ColorColumn      guibg=#14171c guifg=NONE    gui=NONE

hi ALEWarningSign   guifg=#fabd2f guibg=#14171c gui=NONE cterm=NONE
hi ALEErrorSign     guifg=#f93d3d guibg=#14171c gui=NONE cterm=NONE

hi ParenMatch ctermfg=red term=underline cterm=underline gui=underline

hi link javascriptObjectKey Label
hi link yamlBool SpellRare
hi link nixAttributeDefinition Type
hi link nixAttribute Type
hi link nixPath String
hi link nixBoolean SpellRare
hi link nixArgumentDefinition Normal
hi link nixURI String
hi link nixSimpleFunctionArgument Normal
