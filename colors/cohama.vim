set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "cohama"

" base
hi Normal          ctermfg=249  ctermbg=234

" programming literals
hi Comment         ctermfg=242
hi Constant        ctermfg=104               cterm=bold
hi String          ctermfg=174
hi Character       ctermfg=166
hi Number          ctermfg=204
hi Boolean         ctermfg=204
hi Float           ctermfg=204

" programming statements
hi Identifier      ctermfg=215               cterm=none
hi Function        ctermfg=114
hi Statement       ctermfg=219
hi Conditional     ctermfg=217
hi Repeat          ctermfg=217
hi Label           ctermfg=158
hi Operator        ctermfg=229
hi Keyword         ctermfg=219
hi Exception       ctermfg=217

" programming pre-processes
hi PreProc         ctermfg=37
hi Include         ctermfg=37
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
hi SpecialComment  ctermfg=245               cterm=bold
hi Debug           ctermfg=219               cterm=bold
hi SpecialKey      ctermfg=61

" vim views
hi Cursor          ctermfg=16   ctermbg=253
hi CursorIM        ctermfg=16   ctermbg=124
hi CursorLine                   ctermbg=232  cterm=none
hi CursorColumn                 ctermbg=232
hi ColorColumn                  ctermbg=23
hi Conceal         ctermfg=240
hi LineNr          ctermfg=239  ctermbg=233
hi CursorLineNr    ctermfg=253  ctermbg=233
hi FoldColumn      ctermfg=240  ctermbg=233
hi SignColumn                   ctermbg=234
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
" highlight DiffAdd ctermfg=119 ctermbg=NONE cterm=NONE
" highlight DiffDelete ctermfg=167 ctermbg=NONE cterm=NONE
" highlight DiffChange ctermfg=227 ctermbg=NONE cterm=NONE
" highlight DiffText ctermfg=203 ctermbg=NONE cterm=bold

  hi DiffAdd ctermfg=71 ctermbg=235 guifg=#5c9a61 guibg=#222532 guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi DiffAdded ctermfg=71 ctermbg=235 guifg=#5c9a61 guibg=#222532 guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi DiffChange ctermfg=NONE ctermbg=236 guifg=NONE guibg=#2d3243 guisp=NONE cterm=NONE gui=NONE
  hi DiffDelete ctermfg=174 ctermbg=235 guifg=#ca7375 guibg=#222532 guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi DiffRemoved ctermfg=174 ctermbg=235 guifg=#ca7375 guibg=#222532 guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi DiffChanged ctermfg=136 ctermbg=235 guifg=#a58949 guibg=#222532 guisp=NONE cterm=NONE,reverse gui=NONE,reverse
  hi DiffText ctermfg=136 ctermbg=235 guifg=#a58949 guibg=#222532 guisp=NONE cterm=NONE,reverse gui=NONE,reverse
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
hi VertSplit       ctermfg=232  ctermbg=232   cterm=bold
hi Visual          ctermfg=255  ctermbg=33
hi VisualNOS       ctermfg=255  ctermbg=33
hi WarningMsg      ctermfg=231  ctermbg=238   cterm=bold
hi WildMenu        ctermfg=110  ctermbg=16
