" Name:         Selenized black/white, beta version
" Author:       Jan Warchoł <jan.warchol@gmail.com>
" Maintainer:   Jan Warchoł <jan.warchol@gmail.com>
" License:      Vim License (see `:help license`)

set background=dark

hi clear

let g:colors_name = 'selenized_bw'

let g:terminal_ansi_colors = ['#252525', '#ed4a46', '#70b433', '#dbb32d',
      \ '#368aeb', '#eb6eb7', '#3fc5b7', '#777777', '#3b3b3b', '#ff5e56',
      \ '#83c746', '#efc541', '#4f9cfe', '#ff81ca', '#56d8c9', '#dedede']
hi Normal guifg=#b9b9b9 guibg=#181818 guisp=NONE gui=NONE cterm=NONE
hi IncSearch guifg=#e67f43 guibg=NONE guisp=NONE gui=reverse cterm=reverse
hi Search guifg=#dbb32d guibg=NONE guisp=NONE gui=reverse cterm=reverse
hi! link QuickFixLine Search
hi Visual guifg=NONE guibg=#3b3b3b guisp=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#efc541 guibg=#3b3b3b guisp=NONE gui=bold cterm=bold
hi Cursor guifg=NONE guibg=NONE guisp=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
hi! link lCursor Cursor
hi CursorLine guifg=NONE guibg=#252525 guisp=NONE gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#252525 guisp=NONE gui=NONE cterm=NONE
hi Folded guifg=NONE guibg=#252525 guisp=NONE gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#3b3b3b guisp=NONE gui=NONE cterm=NONE
hi LineNr guifg=#474747 guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#dedede guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#333333 guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#333333 guibg=#b9b9b9 guisp=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
hi StatusLineNC guifg=#777777 guibg=#333333 guisp=NONE gui=NONE cterm=NONE
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi TabLineSel guifg=#252525 guibg=#dedede guisp=NONE gui=bold,reverse cterm=bold,reverse
hi TabLine guifg=#333333 guibg=#777777 guisp=NONE gui=reverse cterm=reverse
hi TabLineFill guifg=#333333 guibg=NONE guisp=NONE gui=reverse cterm=reverse
hi Pmenu guifg=#777777 guibg=#252525 guisp=NONE gui=NONE cterm=NONE
hi PmenuSel guifg=NONE guibg=#3b3b3b guisp=NONE gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#777777 guisp=NONE gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#3b3b3b guisp=NONE gui=NONE cterm=NONE
hi DiffAdd         guifg=NONE guibg=#1d2021
hi DiffChange      guifg=NONE guibg=#1d2021
hi DiffDelete      guifg=#6a3832 guibg=#1d2021
hi DiffText        guifg=NONE guibg=#353c4f
hi diffAdded guifg=#70b433 guibg=NONE gui=NONE cterm=NONE
hi diffRemoved guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi diffChanged guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi Comment guifg=#777777 guibg=NONE guisp=NONE gui=italic cterm=italic
hi Constant guifg=#3fc5b7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi! link String Constant
hi! link Number Constant
hi! link Boolean Constant
hi! link Character Constant
hi! link Float Constant
hi FloatBorder guifg=#353c4f guibg=#1d2021
hi Identifier guifg=#4f9cfe guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi! link Function Identifier
hi Statement guifg=#efc541 guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Keyword Statement
hi! link Label Statement
hi! link Exception Statement
hi! link Operator Statement
hi PreProc guifg=#e67f43 guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi! link Define PreProc
hi! link PreCondit PreProc
hi! link Include PreProc
hi! link Macro Include
hi Type guifg=#70b433 guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi! link Typedef Type
hi! link StorageClass Type
hi! link Structure Type
hi Special guifg=#ed4a46 guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi! link SpecialChar Special
hi! link Delimiter Special
hi! link SpecialComment Special
hi! link Debug Special
hi! link Tag Special
hi Error guifg=#ed4a46 guibg=NONE guisp=NONE gui=bold cterm=bold
hi Todo guifg=#eb6eb7 guibg=NONE guisp=NONE gui=bold cterm=bold
hi Underlined guifg=#a580e2 guibg=NONE guisp=NONE gui=underline cterm=underline
hi Ignore guifg=#3b3b3b guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi VimCommand guifg=#dbb32d guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi RubyDefine guifg=#dedede guibg=NONE guisp=NONE gui=bold cterm=bold
hi Terminal guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Conceal guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Directory guifg=#4f9cfe guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi EndOfBuffer guifg=#333333 guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ErrorMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi FoldColumn guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi ModeMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi MoreMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi NonText guifg=#333333 guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Question guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi SignColumn guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpecialKey guifg=#333333 guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi SpellBad guifg=NONE guibg=NONE guisp=#ed4a46 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi SpellCap guifg=NONE guibg=NONE guisp=#ed4a46 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi SpellLocal guifg=NONE guibg=NONE guisp=#dbb32d gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi SpellRare guifg=NONE guibg=NONE guisp=#3fc5b7 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
hi Title guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi VisualNOS guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi WarningMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi WildMenu guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE

hi CocUnderline    cterm=undercurl gui=undercurl
hi CocGitAddedSign guifg=#70b433 guibg=#181818
hi CocGitChangeRemovedSign guifg=#fb4934 guibg=#181818
hi CocGitChangedSign guifg=#fabd2f guibg=#181818
hi CocGitRemovedSign guifg=#fb4934 guibg=#181818
hi CocGitTopRemovedSign guifg=#fb4934 guibg=#181818
hi CocFloating     guibg=#252525
hi CocErrorSign    guifg=#fb4934 guibg=#181818
hi CocWarningSign  guifg=#fbad34 guibg=#181818
hi CocInfoSign     guifg=#15aabf guibg=#181818
hi CocHintSign     guifg=#15aabf guibg=#181818
hi CocInlayHint    guifg=#333333 guibg=#181818
hi CocSuggestFloating guibg=#333333

" vim: et ts=2 sw=2
