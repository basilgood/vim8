set background=dark

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name='test'

hi Constant     guifg=#A38D61 guibg=NONE    gui=bold      cterm=bold
hi Folded       guifg=#616161 guibg=NONE
hi Statement    guifg=#5E81AC
hi IncSearch    guifg=#1d2021 guibg=#fb4934 gui=NONE      cterm=NONE
hi Search       guibg=#ffffaf guifg=#262626 gui=bold      cterm=bold,reverse
hi Visual       guibg=#292E38 term=NONE     cterm=NONE    gui=NONE     guifg=NONE
hi Identifier   guifg=#81A1C1
hi PreProc      guifg=#9E7D98
hi Special      guifg=#B37460
hi SpecialKey   guifg=#3f4f54 guibg=#191919
hi Normal       guibg=#161616 guifg=#81848A
hi Comment      guifg=#41495A gui=italic    ctermfg=NONE  ctermbg=NONE cterm=italic
hi CursorLine   guibg=#191919
hi ColorColumn  guibg=#191919
hi MatchParen   gui=bold      guifg=#fdf6e3 guibg=NONE
hi LineNr       guifg=#5c5c5c guibg=#14171c gui=NONE
hi CursorLineNr guibg=#212121 guifg=#839496
hi diffAdded    guifg=#2BFF2B gui=NONE      ctermfg=46    cterm=NONE
hi diffRemoved  guifg=#FF2B2B gui=NONE      ctermfg=203   cterm=NONE
hi link         diffSubname   Normal
hi DiffAdd      guifg=#8ec07c guibg=#1d2021 cterm=NONE
hi link         DiffChange    NONE
hi clear        DiffChange
hi DiffDelete   guifg=#f93d3d guibg=#1d2021 cterm=NONE
hi DiffText     guifg=#FFB86C guibg=#14141a gui=NONE      cterm=NONE
hi Type         guifg=#A38D61
hi VertSplit    guibg=#212121 guifg=#212121
hi Pmenu        cterm=NONE    gui=NONE      guibg=#252525 guifg=#696C70
hi PmenuSel     cterm=NONE    gui=NONE      guibg=#343638 guifg=NONE
hi PmenuSbar    cterm=NONE    gui=NONE      guibg=#343638 guifg=NONE
hi PmenuThumb   cterm=NONE    gui=NONE      guibg=#515457 guifg=NONE
