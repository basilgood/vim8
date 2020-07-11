hi clear
if exists('syntax_on')
  syntax reset
endif

let colors_name = 'min'
" base
" hi Normal          ctermfg=181  ctermbg=NONE cterm=NONE
hi EndOfBuffer     ctermfg=237    ctermbg=NONE cterm=NONE

" programming literals
hi Comment         ctermfg=59   ctermbg=NONE cterm=italic
hi Constant        ctermfg=104               cterm=NONE
hi String          ctermfg=65
hi Character       ctermfg=166
hi Number          ctermfg=204
hi Boolean         ctermfg=204
hi Float           ctermfg=204

" programming statements
hi Identifier      ctermfg=103               cterm=NONE
hi Statement       ctermfg=167               cterm=NONE

" programming pre-processes
hi PreProc         ctermfg=143                cterm=NONE
hi Include         ctermfg=173
hi Define          ctermfg=173
hi Macro           ctermfg=173
hi PreCondit       ctermfg=173

" programming types
hi Type            ctermfg=179               cterm=NONE
hi Structure       ctermfg=116

" specials
hi Special         ctermfg=173
hi Delimiter       ctermfg=59
hi StorageClass    ctermfg=174

" vim views
hi Cursor          ctermfg=16   ctermbg=253
hi CursorIM        ctermfg=16   ctermbg=124
hi CursorLine                   ctermbg=236  cterm=NONE
hi CursorColumn                 ctermbg=236  cterm=NONE
hi ColorColumn                  ctermbg=23
hi Conceal         ctermfg=240
hi LineNr          ctermfg=237  ctermbg=NONE
hi CursorLineNr    ctermfg=7    ctermbg=235  cterm=NONE
hi FoldColumn      ctermfg=240  ctermbg=233
hi SignColumn      ctermfg=NONE ctermbg=NONE
hi Folded          ctermfg=109  ctermbg=16
hi Search          ctermfg=237  ctermbg=140  cterm=reverse
hi IncSearch       ctermfg=1    ctermbg=21
hi QuickFixLine    ctermfg=202  ctermbg=NONE
hi NonText         ctermfg=8    ctermbg=NONE cterm=NONE
hi SpecialKey      ctermfg=8    ctermbg=NONE cterm=NONE
hi StatusLine      ctermfg=252  ctermbg=237   cterm=NONE
hi StatusLineNC    ctermfg=239  ctermbg=235  cterm=NONE
hi Todo            ctermfg=33   ctermbg=NONE cterm=NONE
hi TabLine         ctermfg=252  ctermbg=235 cterm=NONE
hi TabLineSel      ctermfg=235  ctermbg=162 cterm=bold
hi TabLineFill     ctermfg=252  ctermbg=235 cterm=NONE
hi Title           ctermfg=227               cterm=NONE

" diffs
hi DiffAdd         cterm=NONE   ctermbg=235
hi DiffChange      cterm=NONE   ctermbg=235
hi DiffDelete      cterm=NONE   ctermfg=96  ctermbg=NONE
hi DiffText        cterm=NONE   ctermfg=195  ctermbg=240
hi diffAdded       ctermfg=40              cterm=NONE
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
hi MatchParen      ctermfg=15   ctermbg=239 cterm=bold
hi ModeMsg         ctermfg=229
hi MoreMsg         ctermfg=229               cterm=NONE
hi Question        ctermfg=110
hi Underlined      ctermfg=244               cterm=underline
hi VertSplit       ctermfg=235  ctermbg=235  cterm=NONE
hi Visual          ctermfg=23   ctermbg=255  cterm=reverse
hi VisualNOS       ctermfg=NONE ctermbg=NONE cterm=underline
hi WarningMsg      ctermfg=231  ctermbg=238  cterm=NONE
hi WildMenu        ctermfg=110  ctermbg=23

" plugins settings
hi GitGutterAdd          ctermfg=22
hi GitGutterChange       ctermfg=136
hi GitGutterDelete       ctermfg=9
hi GitGutterChangeDelete ctermfg=9
hi ALEWarningSign        ctermfg=142 ctermbg=NONE
hi ALEErrorSign          ctermfg=9   ctermbg=NONE
hi Searchlight           ctermfg=27

" nixos
hi! link nixParen Delimiter
hi! link nixListBracket Delimiter
hi! link nixFunctionArgument Delimiter
hi! link nixAttributeSet Delimiter
hi! link nixArgumentSeparator Delimiter
hi! link nixAttributeDefinition Statement
hi! link nixWithExpr Statement
hi! link typescriptParens Delimiter
hi! link typescriptBraces Delimiter
hi! link jsParens Delimiter
hi! link jsBraces Delimiter
hi! link jsBrackets Delimiter
hi! link jsRepeatBraces Delimiter
hi! link jsFuncParens Delimiter
hi! link jsIfElseBraces Delimiter
hi! link jsFuncBraces Delimiter
hi! link jsObjectBraces Delimiter
hi! link jsFunction Statement
hi! link jsReturn Type
