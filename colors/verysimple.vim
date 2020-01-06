runtime colors/delek.vim

let g:colors_name = 'verysimple'

hi Normal           ctermbg=NONE  ctermfg=188
hi Comment          ctermbg=NONE  ctermfg=8    cterm=italic
hi MatchParen       ctermbg=None  ctermfg=199  cterm=bold,underline
hi LineNr           ctermfg=8     ctermbg=NONE cterm=NONE
hi Function         ctermfg=103   ctermbg=NONE cterm=italic
hi NonText          ctermbg=NONE  ctermfg=8    cterm=NONE
hi SpecialKey       ctermbg=NONE  ctermfg=8    cterm=NONE
hi ColorColumn      cterm=NONE    ctermbg=235
hi CursorColumn     cterm=NONE    ctermbg=235
hi CursorLine       ctermbg=235   cterm=NONE
hi CursorLineNr     ctermbg=NONE  ctermfg=253
hi FoldColumn       ctermfg=111   ctermbg=NONE cterm=NONE
hi SignColumn       ctermfg=NONE     ctermbg=NONE
hi Folded           ctermfg=8     ctermbg=NONE cterm=NONE

" diffs
hi DiffAdd          cterm=NONE    ctermbg=235
hi DiffChange       cterm=NONE    ctermbg=235
hi DiffDelete       cterm=NONE    ctermfg=238  ctermbg=244
hi DiffText         cterm=bold    ctermfg=255  ctermbg=196
hi diffAdded        ctermfg=150
hi diffRemoved      ctermfg=203

" Statusline/tabline
hi StatusLine       cterm=reverse ctermbg=234  ctermfg=245
hi StatusLineTerm   cterm=reverse ctermbg=234  ctermfg=245
hi StatusLineNC     cterm=reverse ctermbg=238  ctermfg=233
hi StatusLineTermNC cterm=reverse ctermbg=238  ctermfg=233
hi TabLine          cterm=NONE    ctermbg=233  ctermfg=238
hi TabLineFill      cterm=reverse ctermbg=238  ctermfg=233
hi TabLineSel       cterm=NONE    ctermbg=234  ctermfg=252

" pmenu
hi Pmenu            ctermbg=236   ctermfg=251
hi PmenuSbar        ctermbg=236
hi PmenuSel         ctermbg=240   ctermfg=255
hi PmenuThumb       ctermbg=251

hi VertSplit        cterm=NONE    ctermbg=233  ctermfg=233
hi Visual           ctermbg=235   ctermfg=110  cterm=reverse
hi VisualNOS        ctermbg=NONE  ctermfg=NONE cterm=underline
hi WildMenu         ctermbg=255   ctermfg=234

hi Search           ctermfg=16    ctermbg=24
hi IncSearch        ctermfg=202   ctermbg=16
hi QuickFixLine     ctermbg=none  ctermfg=202

hi SpellBad         ctermbg=95    ctermfg=252
hi SpellCap         ctermbg=24    ctermfg=252
hi SpellLocal       ctermbg=23    ctermfg=252
hi SpellRare        ctermbg=97    ctermfg=252

hi GitGutterAdd    ctermfg=22
hi GitGutterChange ctermfg=142
hi GitGutterDelete ctermfg=9
hi GitGutterChangeDelete ctermfg=9
