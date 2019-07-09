" Vim color file
"
" Maintainer: Justin M. Keyes <justinkz@gmail.com>
" Previous Maintainer: Tomas Restrepo <tomas@winterdom.com>
"
" Based on the Monokai theme for TextMate by Wimer Hazenberg and its darker
" variant by Hamish Stuart Macpherson.
"
" monokai theme copyright Wimer Hazenberg.
"
" molokai.vim source code is licensed as follows:
"
" The MIT License (MIT)
"
" Copyright (c) 2011 Tomas Restrepo
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

hi clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name='molokai'

hi Boolean         guifg=#AE81FF                          ctermfg=141
hi Character       guifg=#E6DB74                          ctermfg=222
hi Number          guifg=#AE81FF                          ctermfg=141
hi String          guifg=#E6DB74                          ctermfg=222
hi Conditional     guifg=#F92672               gui=bold   ctermfg=197  cterm=bold
hi Constant        guifg=#AE81FF               gui=bold   ctermfg=141  cterm=bold
hi Cursor          guifg=#000000 guibg=#F8F8F0            ctermfg=16   ctermbg=253
hi iCursor         guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=bold   ctermfg=225  cterm=bold
hi Define          guifg=#66D9EF                          ctermfg=81
hi Delimiter       guifg=#8F8F8F                          ctermfg=241

" diff (unified)
hi diffAdded       guifg=#2BFF2B gui=NONE      ctermfg=46  cterm=NONE
hi diffRemoved     guifg=#FF2B2B gui=NONE      ctermfg=203 cterm=NONE
hi link diffSubname Normal

" diff (side-by-side)
hi DiffAdd          guifg=#8ec07c guibg=#1d2021 cterm=NONE
hi link DiffChange NONE
hi clear DiffChange
hi DiffDelete       guifg=#f93d3d guibg=#1d2021 cterm=NONE
hi DiffText         guifg=#FFB86C guibg=#14141a gui=NONE cterm=NONE

hi Directory       guifg=#A6E22E               gui=bold        ctermfg=154               cterm=bold

hi Error           ctermbg=NONE ctermfg=255 guibg=#e27878 guifg=white
hi Error           guifg=#FFFFFF   guibg=Red   ctermfg=15 ctermbg=9
hi ErrorMsg        ctermfg=203 ctermbg=NONE guifg=#e27878 guibg=#161821

" hi Exception       ctermfg=118               cterm=bold
hi Exception       guifg=#A6E22E               gui=bold        ctermfg=154               cterm=bold

hi Float           guifg=#AE81FF            ctermfg=141

"If 242 is too dark, keep incrementing...
hi FoldColumn      guifg=#465457 guibg=#000000 ctermfg=242 ctermbg=16
hi Folded          guifg=#465457 guibg=NONE    ctermfg=242 ctermbg=NONE

hi Function        guifg=#A6E22E         ctermfg=154
hi Identifier      guifg=#FD971F       ctermfg=208
hi Ignore          guifg=#808080 guibg=bg           ctermfg=244 ctermbg=234

hi Keyword         guifg=#F92672               gui=bold              ctermfg=197               cterm=bold
hi Label           guifg=#E6DB74               gui=none              ctermfg=229               cterm=none
hi Macro           guifg=#C4BE89               gui=italic            ctermfg=193
hi SpecialKey      guifg=#465457               gui=italic            ctermfg=242

hi MatchParen      guifg=#000000 guibg=#FD971F gui=NONE ctermfg=000 ctermbg=208 cterm=NONE
hi ModeMsg         guifg=#E6DB74          ctermfg=229
hi MoreMsg         guifg=#E6DB74          ctermfg=229
hi Operator        guifg=#F92672          ctermfg=197

" completion/popup menu
hi Pmenu           guifg=#FFFFFF   guibg=#000000             ctermfg=255  ctermbg=16
hi PmenuSel        guifg=#FFFFFF   guibg=#0a9dff gui=NONE    ctermfg=255  ctermbg=242 cterm=NONE
hi PmenuSbar                       guibg=#857f78             ctermbg=232
hi PmenuThumb      guifg=#242321                             ctermfg=81

hi PreCondit       guifg=#A6E22E               gui=bold    ctermfg=154        cterm=bold
hi PreProc         guifg=#A6E22E                           ctermfg=154
hi Question        guifg=#66D9EF                           ctermfg=81
hi Repeat          guifg=#F92672               gui=bold    ctermfg=197        cterm=bold
hi IncSearch        guifg=#1d2021 guibg=#fb4934 gui=NONE cterm=NONE
hi Search           guibg=#ffffaf guifg=#262626 gui=bold cterm=bold,reverse
hi QuickFixLine    guifg=#FFFFFF guibg=#F92672             ctermfg=255        ctermbg=197

" marks
hi SignColumn       guifg=#6c6c6c guibg=#14171c gui=NONE
hi SpecialChar     guifg=#F92672               gui=bold      ctermfg=161               cterm=bold
hi SpecialComment  guifg=#7E8E91               gui=bold   ctermfg=245               cterm=bold
hi Special         guifg=#66D9EF guibg=bg      gui=italic          ctermfg=81

hi SpellBad    guisp=#FF0000 gui=undercurl ctermfg=15   ctermbg=9
hi SpellCap    guisp=#7070F0 gui=undercurl              ctermbg=17
hi SpellLocal  guisp=#70F0F0 gui=undercurl              ctermbg=17
hi SpellRare   guisp=#FFFFFF gui=undercurl ctermfg=none ctermbg=none  cterm=reverse

hi Statement       guifg=#F92672 gui=bold                    ctermfg=197 cterm=bold
hi StatusLine       guifg=#14171c guibg=#777777 gui=bold cterm=bold
hi StatusLineNC     guifg=#999999 guibg=#444444 gui=NONE cterm=NONE

hi StatusLineTerm   guibg=#87875f guifg=#262626 gui=NONE
hi StatusLineTermNC guibg=#444444 guifg=#87875f gui=NONE
hi StorageClass    guifg=#FD971F               gui=italic    ctermfg=208
hi Structure       guifg=#66D9EF                             ctermfg=81
hi Tag             guifg=#F92672               gui=italic    ctermfg=197
hi Title           guifg=#ef5939                             ctermfg=203
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold      ctermfg=231 ctermbg=234   cterm=bold

hi Typedef         guifg=#66D9EF                                    ctermfg=81
hi Type            guifg=#66D9EF               gui=none             ctermfg=81                cterm=none
hi Underlined      guifg=#808080               gui=underline        ctermfg=244               cterm=underline

hi VertSplit        guifg=#333333 guibg=#333333 gui=NONE cterm=NONE
hi VisualNOS                     guibg=#403D3D              ctermbg=238
hi Visual                        guibg=#403D3D              ctermbg=238
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold     ctermfg=231 ctermbg=238   cterm=bold
hi WildMenu        guifg=#66D9EF guibg=#000000              ctermfg=81  ctermbg=16

hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E
hi TabLine         guibg=#1B1D1E guifg=#808080 gui=none

hi Normal          guifg=#F8F8F2 guibg=#1B1D1E          ctermfg=252    ctermbg=234
hi Comment         guifg=#7E8E91                        ctermfg=244
hi CursorLine       guifg=NONE    guibg=#2a303b gui=NONE cterm=NONE
hi CursorLineNr    guifg=#FD971F               gui=none ctermfg=208    cterm=none
hi CursorColumn                  guibg=#293739          ctermbg=236
hi ColorColumn                   guibg=#232526          ctermbg=236
hi LineNr          guifg=#465457 guibg=#14171c gui=none cterm=none
hi NonText         guifg=#465457                        ctermfg=239

hi ALEWarningSign   guifg=#fabd2f guibg=#14171c gui=NONE cterm=NONE
hi ALEErrorSign     guifg=#f93d3d guibg=#14171c gui=NONE cterm=NONE

hi link javascriptObjectKey Label
hi link nixAttributeDefinition Type
hi link nixAttribute Type
hi link nixPath String
hi link nixArgumentDefinition Normal
hi link nixURI String
hi link nixSimpleFunctionArgument Normal

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark
