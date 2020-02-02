hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'min'

" base
hi Normal          ctermfg=181  ctermbg=NONE cterm=NONE
hi EndOfBuffer     ctermfg=8    ctermbg=NONE cterm=NONE

" programming literals
hi Comment         ctermfg=8    ctermbg=NONE cterm=italic
hi Constant        ctermfg=104               cterm=NONE
hi String          ctermfg=65
hi Character       ctermfg=166
hi Number          ctermfg=204
hi Boolean         ctermfg=204
hi Float           ctermfg=204

" programming statements
hi Identifier      ctermfg=216               cterm=NONE
hi Function        ctermfg=68   ctermbg=NONE cterm=italic
hi Statement       ctermfg=175               cterm=NONE
hi Conditional     ctermfg=217               cterm=NONE
hi Repeat          ctermfg=217               cterm=NONE
hi Label           ctermfg=158               cterm=NONE
hi Operator        ctermfg=229               cterm=NONE
hi Keyword         ctermfg=182               cterm=NONE
hi Exception       ctermfg=217               cterm=NONE

" programming pre-processes
hi PreProc         ctermfg=174                cterm=NONE
hi Include         ctermfg=174
hi Define          ctermfg=174
hi Macro           ctermfg=174
hi PreCondit       ctermfg=174

" programming types
hi Type            ctermfg=110               cterm=NONE
hi StorageClass    ctermfg=110
hi Structure       ctermfg=75
hi Typedef         ctermfg=110

" specials
hi Special         ctermfg=69
hi Delimiter       ctermfg=255
hi SpecialComment  ctermfg=245               cterm=NONE
hi Debug           ctermfg=219               cterm=NONE

" vim views
hi Cursor          ctermfg=16   ctermbg=253
hi CursorIM        ctermfg=16   ctermbg=124
hi CursorLine                   ctermbg=236  cterm=NONE
hi CursorColumn                 ctermbg=236  cterm=NONE
hi ColorColumn                  ctermbg=23
hi Conceal         ctermfg=240
hi LineNr          ctermfg=8    ctermbg=NONE
hi CursorLineNr    ctermfg=7    ctermbg=235  cterm=NONE
hi FoldColumn      ctermfg=240  ctermbg=233
hi SignColumn      ctermfg=NONE ctermbg=NONE
hi Folded          ctermfg=109  ctermbg=16
hi Search          ctermfg=7    ctermbg=59   cterm=NONE
hi IncSearch       ctermfg=16   ctermbg=202
hi QuickFixLine    ctermfg=202  ctermbg=NONE
hi NonText         ctermfg=8    ctermbg=NONE cterm=NONE
hi SpecialKey      ctermfg=8    ctermbg=NONE cterm=NONE
hi StatusLine      ctermfg=255  ctermbg=96   cterm=NONE
hi StatusLineNC    ctermfg=239  ctermbg=235  cterm=NONE
hi Todo            ctermfg=33   ctermbg=NONE cterm=NONE
" hi TabLine         ctermfg=245  ctermbg=237  cterm=NONE
" hi TabLineSel      ctermfg=255  ctermbg=233  cterm=NONE
" hi TabLineFill     ctermfg=245  ctermbg=245
hi Title           ctermfg=227               cterm=NONE

" diffs
hi DiffAdd               cterm=NONE     ctermbg=235
hi DiffChange            cterm=NONE     ctermbg=235
hi DiffDelete            cterm=NONE     ctermfg=238  ctermbg=244
hi DiffText              cterm=bold     ctermfg=255  ctermbg=203
hi diffAdded       ctermfg=40                cterm=NONE
hi diffRemoved     ctermfg=204

" complete menus
hi Pmenu           ctermfg=NONE ctermbg=237  cterm=NONE
hi PmenuSel        ctermfg=NONE ctermbg=19
hi PmenuSbar                    ctermbg=239
hi PmenuThumb      ctermbg=244

" errors
hi Error           ctermfg=219  ctermbg=88
hi ErrorMsg        ctermfg=199  ctermbg=16   cterm=NONE
hi SpellBad        ctermbg=52
hi SpellCap        ctermbg=53
hi SpellLocal      ctermbg=53
hi SpellRare       ctermbg=53

" others
hi Directory       ctermfg=114               cterm=NONE
hi Ignore          ctermfg=244  ctermbg=232
hi MatchParen      ctermfg=255  ctermbg=16   cterm=NONE
hi ModeMsg         ctermfg=229
hi MoreMsg         ctermfg=229               cterm=NONE
hi Question        ctermfg=110
hi Underlined      ctermfg=244               cterm=underline
hi VertSplit       ctermfg=235  ctermbg=235  cterm=NONE
hi Visual          ctermfg=96   ctermbg=255  cterm=reverse
hi VisualNOS       ctermfg=NONE ctermbg=NONE cterm=underline
hi WarningMsg      ctermfg=231  ctermbg=238  cterm=NONE
hi WildMenu        ctermfg=110  ctermbg=16

" plugin settings
hi GitGutterAdd          ctermfg=22
hi GitGutterChange       ctermfg=142
hi GitGutterDelete       ctermfg=9
hi GitGutterChangeDelete ctermfg=9
hi ALEWarningSign        ctermfg=yellow ctermbg=NONE
hi ALEErrorSign          ctermfg=red    ctermbg=NONE
