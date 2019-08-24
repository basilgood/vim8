set background=dark

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name='test'

hi Constant         guifg=#A38D61 guibg=NONE    gui=NONE      cterm=NONE
hi Folded           guifg=#616161 guibg=NONE
hi Statement        guifg=#5E81AC
hi IncSearch        guifg=#1d2021 guibg=#fb4934 gui=NONE      cterm=NONE
hi Search           guibg=#ffffaf guifg=#262626 gui=NONE      cterm=NONE,reverse
hi Visual           guibg=#292E38 term=NONE     cterm=NONE    gui=NONE     guifg=NONE
hi Identifier       guifg=#81A1C1
hi PreProc          guifg=#9E7D98
hi Special          guifg=#B37460
hi SpecialKey       guifg=#3f4f54 guibg=#191919
hi Normal           guibg=#161616 guifg=#ebdbb2 gui=NONE      cterm=NONE
hi Comment          guifg=#41495A gui=italic    ctermfg=NONE  ctermbg=NONE cterm=italic
hi CursorLine       guibg=#191919
hi ColorColumn      guibg=#191919
hi MatchParen       gui=NONE      guifg=#fdf6e3 guibg=NONE
hi LineNr           guibg=#111111 guifg=#41495A gui=none cterm=none
hi SignColumn ctermbg=235 ctermfg=239 guibg=#1e2132 guifg=#444b71
hi CursorLineNr     guibg=#212121 guifg=#839496
hi diffAdded        guifg=#2BFF2B gui=NONE      ctermfg=46    cterm=NONE
hi diffRemoved      guifg=#FF2B2B gui=NONE      ctermfg=203   cterm=NONE
hi link             diffSubname   Normal
hi DiffAdd          guifg=#8ec07c guibg=#1d2021 cterm=NONE
hi link             DiffChange    NONE
hi clear            DiffChange
hi DiffDelete       guifg=#f93d3d guibg=#1d2021 cterm=NONE
hi DiffText         guifg=#FFB86C guibg=#14141a gui=NONE      cterm=NONE
hi Type             guifg=#A38D61
hi VertSplit        guibg=#212121 guifg=#212121
hi Pmenu           guibg=#242424 guifg=#ccccbc
hi PMenuSel        guibg=#353a37 guifg=#ccdc90 gui=bold
hi PmenuSbar       guibg=#2e3330 guifg=#000000
hi PMenuThumb      guibg=#a0afa0 guifg=#040404
hi TabLine          guifg=#999999 guibg=#444444 gui=NONE      cterm=NONE
hi TabLineFill      guifg=NONE    guibg=#444444 gui=NONE      cterm=NONE
hi TabLineSel       guifg=#c9d05c guibg=NONE    gui=NONE      cterm=NONE
hi StatusLine       guifg=#111111 guibg=#777777 gui=bold      cterm=bold
hi StatusLineNC     guifg=#999999 guibg=#333333 gui=NONE      cterm=NONE
hi StatusLineTerm   guibg=#87875f guifg=#262626 gui=NONE
hi StatusLineTermNC guibg=#444444 guifg=#87875f gui=NONE
