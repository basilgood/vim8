hi clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'retro'

" base
hi Normal           ctermbg=NONE        ctermfg=249        cterm=NONE

" programming literals
hi Comment         ctermfg=8               cterm=italic
hi Constant        ctermfg=204               cterm=bold
hi String          ctermfg=37
hi Character       ctermfg=166
hi Number          ctermfg=168
hi Boolean         ctermfg=204
hi Float           ctermfg=204

" programming statements
hi Identifier      ctermfg=215               cterm=none
hi Function        ctermfg=114             cterm=italic
hi Statement ctermfg=67 ctermbg=NONE cterm=NONE
hi Conditional     ctermfg=217
hi Repeat          ctermfg=217
hi Label           ctermfg=158
hi Operator        ctermfg=229
hi Keyword         ctermfg=219
hi Exception       ctermfg=217

" programming pre-processes
hi PreProc         ctermfg=37
hi Include         ctermfg=174
hi Define          ctermfg=37
hi Macro           ctermfg=37
hi PreCondit       ctermfg=37

" programming types
hi Type            ctermfg=110
hi StorageClass    ctermfg=110
hi Structure       ctermfg=75
hi Typedef         ctermfg=110

" specials
hi Special         ctermfg=69
hi Delimiter       ctermfg=255
hi SpecialComment  ctermfg=245               cterm=italic
hi Debug           ctermfg=219               cterm=bold
hi SpecialKey      ctermfg=61

" vim views
hi Cursor          ctermfg=16   ctermbg=253
hi CursorIM        ctermfg=16   ctermbg=124
hi CursorLine                   ctermbg=235  cterm=none
hi CursorColumn                 ctermbg=235
hi ColorColumn                  ctermbg=23
hi Conceal         ctermfg=240
hi LineNr          ctermfg=239  ctermbg=none
hi CursorLineNr    ctermfg=253  ctermbg=none
hi FoldColumn      ctermfg=240  ctermbg=233
hi SignColumn      ctermfg=0    ctermbg=none
hi Folded          ctermfg=109  ctermbg=16
hi Search          ctermfg=16  ctermbg=24
hi IncSearch       ctermfg=202   ctermbg=16
hi QuickFixLine ctermbg=none ctermfg=202
hi NonText         ctermfg=239  ctermbg=none
hi SpecialKey      ctermfg=239  ctermbg=none
hi StatusLine cterm=reverse ctermbg=234 ctermfg=245
hi StatusLineTerm cterm=reverse ctermbg=234 ctermfg=245
hi StatusLineNC cterm=reverse ctermbg=238 ctermfg=233
hi StatusLineTermNC cterm=reverse ctermbg=238 ctermfg=233
hi TabLine cterm=NONE ctermbg=233 ctermfg=238
hi TabLineFill cterm=reverse ctermbg=238 ctermfg=233
hi TabLineSel cterm=NONE ctermbg=234 ctermfg=252
hi Todo            ctermfg=33   ctermbg=NONE cterm=bold
hi Title           ctermfg=227

" diffs
hi DiffAdd cterm=NONE ctermbg=235
hi DiffChange cterm=NONE ctermbg=235
hi DiffDelete cterm=NONE ctermfg=238   ctermbg=244
hi DiffText cterm=bold ctermfg=255   ctermbg=196

hi diffAdded ctermfg=150 guifg=#b4be82
hi diffRemoved ctermfg=203 guifg=#e27878

" complete menus
hi Pmenu           ctermfg=NONE ctermbg=237
hi PmenuSel        ctermfg=NONE ctermbg=19
hi PmenuSbar                    ctermbg=239
hi PmenuThumb      ctermbg=244

" errors
hi Error           ctermfg=219  ctermbg=88
hi ErrorMsg        ctermfg=199  ctermbg=16   cterm=bold
hi SpellBad        ctermbg=52
hi SpellCap        ctermbg=53
hi SpellLocal      ctermbg=53
hi SpellRare       ctermbg=53

" others
hi Directory       ctermfg=114               cterm=bold
hi Ignore          ctermfg=244  ctermbg=232
hi MatchParen      ctermfg=255  ctermbg=53   cterm=bold
hi ModeMsg         ctermfg=229
hi MoreMsg         ctermfg=229
hi Question        ctermfg=110
hi Underlined      ctermfg=244               cterm=underline
hi VertSplit       ctermfg=235  ctermbg=235   cterm=bold
hi Visual          ctermfg=255  ctermbg=33
hi VisualNOS       ctermfg=255  ctermbg=33
hi WarningMsg      ctermfg=231  ctermbg=238   cterm=bold
hi WildMenu        ctermfg=110  ctermbg=16
hi GitGutterAdd ctermfg=22
hi GitGutterChange ctermfg=178
hi GitGutterDelete ctermfg=196
hi GitGutterChangeDelete ctermfg=160
