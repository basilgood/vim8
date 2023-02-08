" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
" https://github.com/tomasr/molokai
"
" Note: Based on the Monokai theme for TextMate
" by Wimer Hazenberg and its darker variant
" by Hamish Stuart Macpherson
"

hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="molokai"

hi Boolean         guifg=#AE81FF
hi Character       guifg=#E6DB74
hi Number          guifg=#AE81FF
hi String          guifg=#E6DB74
hi Conceal         guibg=NONE
hi Conditional     guifg=#F92672               gui=bold
hi Constant        guifg=#AE81FF               gui=bold
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi iCursor         guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#66D9EF
hi Delimiter       guifg=#8F8F8F
hi DiffAdd         guifg=NONE guibg=#1d2021
hi DiffChange      guifg=NONE guibg=#1d2021
hi DiffDelete      guifg=#6a3832 guibg=#1d2021
hi DiffText        guifg=NONE guibg=#353c4f
hi diffAdded       guifg=#b8bb26 guibg=NONE gui=NONE cterm=NONE
hi diffRemoved     guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi diffChanged     guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi diffFile        guifg=#fe8019 guibg=NONE gui=NONE cterm=NONE
hi diffNewFile     guifg=#fabd2f guibg=NONE gui=NONE cterm=NONE
hi diffLine        guifg=#83a598 guibg=NONE gui=NONE cterm=NONE

hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#E6DB74 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#A6E22E               gui=bold
hi Float           guifg=#333333
hi FloatBorder     guifg=#333333
hi FoldColumn      guifg=#465457 guibg=NONE
hi Folded          guifg=#465457 guibg=NONE
hi Function        guifg=#A6E22E
hi Identifier      guifg=#FD971F
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000
hi CurSearch       guifg=#000000 guibg=#C4BE89

hi Keyword         guifg=#F92672               gui=bold
hi Label           guifg=#E6DB74               gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi SpecialKey      guifg=#66D9EF               gui=italic

hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg         guifg=#E6DB74
hi MoreMsg         guifg=#E6DB74
hi Operator        guifg=#F92672

hi Pmenu           guifg=#66D9EF guibg=#333333
hi PmenuSel        guifg=#66D9EF guibg=#232a2b
hi PmenuSbar       guifg=#232a2b guibg=#808080
hi PmenuThumb      guifg=#66D9EF guibg=#232a2b

hi PreCondit       guifg=#A6E22E               gui=bold
hi PreProc         guifg=#A6E22E
hi Question        guifg=#66D9EF
hi Repeat          guifg=#F92672               gui=bold
hi Search          guifg=#000000 guibg=#4a4a48

hi SignColumn      guifg=#A6E22E guibg=NONE
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#7E8E91               gui=bold
hi Special         guifg=#66D9EF guibg=bg      gui=italic
hi SpellBad        guisp=#FF0000 gui=undercurl
hi SpellCap        guisp=#7070F0 gui=undercurl
hi SpellLocal      guisp=#70F0F0 gui=undercurl
hi SpellRare       guisp=#FFFFFF gui=undercurl
hi Statement       guifg=#F92672               gui=bold
hi StatusLine      guifg=#333333 guibg=fg
hi StatusLineNC    guifg=#333333 guibg=#151718
hi StorageClass    guifg=#FD971F               gui=italic
hi Structure       guifg=#66D9EF
hi Tag             guifg=#F92672               gui=italic
hi Title           guifg=#ef5939
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef         guifg=#66D9EF
hi Type            guifg=#66D9EF               gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#333333 guibg=#1B1D1E gui=none cterm=none
hi VisualNOS                     guibg=#232a2b
hi Visual                        guibg=#232a2b
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000

hi TabLine         guibg=#1B1D1E guifg=#808080 gui=none cterm=none
hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E gui=none cterm=none
hi TabLineSel      guifg=#ebdbb2 guibg=#3c3836 gui=NONE cterm=none

hi Normal          guifg=#EBEBE1 guibg=#1B1D1E
hi Comment         guifg=#7E8E91
hi CursorLine                    guibg=#232a2b
hi CursorLineNr    guifg=#FD971F               gui=none
hi CursorColumn                  guibg=#232a2b
hi ColorColumn                   guibg=#232526
hi LineNr          guifg=#333333 guibg=NONE
hi NonText         guifg=#333333
hi SpecialKey      guifg=#333333

hi CocUnderline    cterm=undercurl gui=undercurl
hi CocFloating     guibg=#292d2f
hi CocErrorSign    guifg=#BF616A guibg=#1B1D1E
hi CocWarningSign  guifg=#EBCB8B guibg=#1B1D1E
hi CocInfoSign     guifg=#83a598 guibg=#1B1D1E
hi CocHintSign     guifg=#83a598 guibg=#1B1D1E
hi CocGitAddedSign guifg=#8ec07c guibg=#1B1D1E
hi CocGitChangeRemovedSign guifg=#BF616A guibg=#1B1D1E
hi CocGitChangedSign guifg=#fabd2f guibg=#1B1D1E
hi CocGitRemovedSign guifg=#BF616A guibg=#1B1D1E
hi CocGitTopRemovedSign guifg=#BF616A guibg=#1B1D1E
hi CocSuggestFloating guibg=#333333
hi link CocCodeLens Comment
hi link CocHintLine NONE
