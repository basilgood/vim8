hi clear

if exists('syntax_on')
syntax reset
endif

let colors_name = 'min'

" base
hi Normal           ctermbg=NONE        ctermfg=15        cterm=NONE

" programming literals
hi Comment         ctermfg=8               cterm=italic
hi Constant        ctermfg=132               cterm=bold
hi String          ctermfg=30
" hi Character       ctermfg=166
hi Number          ctermfg=132
" hi Boolean         ctermfg=204
" hi Float           ctermfg=204

" programming statements
hi Identifier      ctermfg=103               cterm=none
" hi Function        ctermfg=114
hi Function        ctermfg=103
" hi Statement       ctermfg=219
hi Statement       ctermfg=103
" hi Conditional     ctermfg=217
" hi Repeat          ctermfg=217
" hi Label           ctermfg=158
" hi Operator        ctermfg=229
hi Operator        ctermfg=103
" hi Keyword         ctermfg=219
" hi Exception       ctermfg=217

" programming pre-processes
hi PreProc         ctermfg=111
" hi Include         ctermfg=174
" hi Define          ctermfg=37
" hi Macro           ctermfg=37
" hi PreCondit       ctermfg=37

" programming types
" hi Type            ctermfg=110
hi Type            ctermfg=103
hi StorageClass    ctermfg=15
" hi Structure       ctermfg=75
" hi Typedef         ctermfg=110

" specials
hi Special         ctermfg=3
" hi Delimiter       ctermfg=255
" hi SpecialComment  ctermfg=245               cterm=bold
hi Debug           ctermfg=219               cterm=bold
hi SpecialKey      ctermfg=8

" vim views
hi CursorLine    ctermfg=NONE ctermbg=0    cterm=NONE
hi CursorLineNr  ctermfg=0    ctermbg=103  cterm=NONE
hi CursorColumn  ctermfg=NONE ctermbg=0    cterm=NONE
hi ColorColumn                  ctermbg=23
hi Conceal         ctermfg=240
hi LineNr        ctermfg=8    ctermbg=NONE cterm=NONE
hi FoldColumn    ctermfg=111  ctermbg=NONE cterm=NONE
hi SignColumn      ctermfg=0    ctermbg=none
hi Folded        ctermfg=8    ctermbg=NONE cterm=NONE
hi Search          ctermfg=16  ctermbg=24
hi IncSearch       ctermfg=202   ctermbg=16
hi QuickFixLine ctermbg=none ctermfg=202
hi NonText       ctermfg=8    ctermbg=NONE cterm=NONE
hi SpecialKey    ctermfg=8    ctermbg=NONE cterm=NONE
hi StatusLine cterm=reverse ctermbg=234 ctermfg=245
hi StatusLineTerm cterm=reverse ctermbg=234 ctermfg=245
hi StatusLineNC cterm=reverse ctermbg=238 ctermfg=233
hi StatusLineTermNC cterm=reverse ctermbg=238 ctermfg=233
hi TabLine cterm=NONE ctermbg=233 ctermfg=238
hi TabLineFill cterm=reverse ctermbg=238 ctermfg=233
hi TabLineSel cterm=NONE ctermbg=234 ctermfg=252
hi Todo          ctermfg=3    ctermbg=NONE cterm=reverse
hi Title         ctermfg=111  ctermbg=NONE cterm=NONE

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
hi Directory     ctermfg=4    ctermbg=NONE cterm=NONE
hi Ignore          ctermfg=244  ctermbg=232
hi MatchParen    ctermfg=3    ctermbg=8    cterm=NONE
hi ModeMsg         ctermfg=229
hi MoreMsg         ctermfg=229
hi Question      ctermfg=111  ctermbg=NONE cterm=NONE
hi Underlined      ctermfg=244               cterm=underline
hi VertSplit       ctermfg=235  ctermbg=235   cterm=bold
hi Visual        ctermfg=103  ctermbg=NONE cterm=reverse
hi VisualNOS       ctermfg=255  ctermbg=33
hi WarningMsg      ctermfg=231  ctermbg=238   cterm=bold
hi WildMenu        ctermfg=110  ctermbg=16
