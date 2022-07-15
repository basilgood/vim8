vim9script

set background=dark
hi clear
g:colors_name = 'nice'

hi Normal guifg=#ebdbb2 guibg=#232323 gui=NONE cterm=NONE
hi NonText guifg=#4c566a guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#4c566a guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#3c3c3c guibg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#3c3c3c guibg=#232323 gui=NONE cterm=NONE
hi FoldColumn guifg=#3c3c3c guibg=#1c1c1c gui=NONE cterm=NONE
hi Folded guifg=#3c3c3c guibg=#1c1c1c gui=NONE cterm=NONE
hi MatchParen guifg=#cae070 guibg=#1c1c1c gui=NONE cterm=NONE
hi SignColumn guifg=#3c3c3c guibg=#1c1c1c gui=NONE cterm=NONE
hi Pmenu guifg=#ebdbb2 guibg=#333333 gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#585858 gui=NONE cterm=NONE
hi PmenuSel guifg=#232323 guibg=#5f8787 gui=NONE cterm=NONE
hi PmenuThumb guifg=#5f8787 guibg=#5f8787 gui=NONE cterm=NONE
hi ErrorMsg guifg=#af5f5f guibg=#232323 gui=reverse cterm=reverse
hi ModeMsg guifg=#87af87 guibg=#232323 gui=reverse cterm=reverse
hi MoreMsg guifg=#5f8787 guibg=NONE gui=NONE cterm=NONE
hi Question guifg=#87af87 guibg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=#af5f5f guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=#232323 guibg=#ebdbb2 gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#1f1f1f gui=NONE cterm=NONE
hi CursorLineNr guifg=#7c7c7c guibg=#1f1f1f gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#1f1f1f gui=NONE cterm=NONE
hi StatusLine guifg=#ebdbb2 guibg=#333333 gui=NONE cterm=NONE
hi StatusLineNC guifg=#333333 guibg=#1c1c1c gui=NONE cterm=NONE
hi StatusLineTerm guifg=#232323 guibg=#1c1c1c gui=NONE cterm=NONE
hi StatusLineTermNC guifg=#1c1c1c guibg=#333333 gui=NONE cterm=NONE
hi TabLine guifg=#777777 guibg=#1c1c1c gui=NONE cterm=NONE
hi TabLineFill guifg=#1c1c1c guibg=#1c1c1c gui=NONE cterm=NONE
hi TabLineSel guifg=#c1c1c1 guibg=#333333 gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi ToolbarButton guifg=#ebdbb2 guibg=#585858 gui=NONE cterm=NONE
hi Visual guifg=NONE guibg=#16191a
hi VisualNOS guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi VertSplit guifg=#232323 guibg=#1f1f1f
hi WildMenu guifg=#232323 guibg=#87afd7 gui=NONE cterm=NONE
hi DiffAdd guifg=NONE guibg=#1F1F1F
hi DiffChange guifg=NONE guibg=#1F1F1F
hi DiffDelete guifg=NONE guibg=#1F1F1F
hi DiffText guifg=NONE guibg=#283542
hi diffAdded guifg=#A3BE8C guibg=#232323
hi diffRemoved guifg=#BF616A guibg=#232323
hi Search guifg=#8FBCBB guibg=#434C5E
hi CurSearch guifg=NONE guibg=#bf2232 gui=NONE
hi IncSearch guifg=NONE guibg=#bf2232 gui=NONE cterm=NONE
hi Directory guifg=#5fafaf guibg=NONE gui=NONE cterm=NONE
hi debugPC guifg=NONE guibg=#709de0 gui=NONE cterm=NONE
hi debugBreakpoint guifg=NONE guibg=#af5f5f gui=NONE cterm=NONE
hi SpellBad guifg=#af5f5f guibg=NONE guisp=#af5f5f gui=undercurl cterm=undercurl
hi SpellCap guifg=#5fafaf guibg=NONE guisp=#5fafaf gui=undercurl cterm=undercurl
hi SpellLocal guifg=#5f875f guibg=NONE guisp=#5f875f gui=undercurl cterm=undercurl
hi SpellRare guifg=#ff8700 guibg=NONE guisp=#ff8700 gui=undercurl cterm=undercurl
hi ColorColumn guifg=NONE guibg=#1c1c1c gui=NONE cterm=NONE
hi Comment guifg=#7c7c7c guibg=NONE gui=NONE cterm=NONE
hi Conceal guifg=#ebdbb2 guibg=NONE gui=NONE cterm=NONE
hi Constant guifg=#cae070 guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#af5f5f guibg=NONE gui=reverse cterm=reverse
hi Identifier guifg=#709de0 guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi PreProc guifg=#e09d70 guibg=NONE gui=NONE cterm=NONE
hi Special guifg=#5f875f guibg=NONE gui=NONE cterm=NONE
hi Statement guifg=#709de0 guibg=NONE gui=NONE cterm=NONE
hi String guifg=#70e070 guibg=NONE gui=NONE cterm=NONE
hi Todo guifg=NONE guibg=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
hi Type guifg=#709de0 guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#e09d70 guibg=NONE gui=underline cterm=underline
hi Function guifg=#e07070 guibg=NONE gui=NONE cterm=NONE
hi Title guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi helpLeadBlank guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi helpNormal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi! link Terminal Normal
hi! link CursorIM Cursor
hi! link QuickFixLine Search

hi GitGutterAdd guifg=#A3BE8C guibg=#1c1c1c
hi GitGutterChange guifg=#EBCB8B guibg=#1c1c1c
hi GitGutterChangeDelete guifg=#BF616A guibg=#1c1c1c
hi GitGutterDelete guifg=#BF616A guibg=#1c1c1c
hi ALEWarningSign guifg=#EBCB8B guibg=#1c1c1c
hi ALEErrorSign guifg=#BF616A guibg=#1c1c1c
hi ALEInfoSign guifg=#83a598 guibg=#1c1c1c
hi! link CocCodeLens Comment
hi! link CocErrorSign ALEErrorSign
hi! link CocWarningSign ALEWarningSign
hi! link CocInfoSign ALEInfoSign
hi! link CocHintSign ALEInfoSign
hi! link CocHintLine ALEInfoSign
hi! link CocErrorHighlight ALEError
hi! link CocWarningHighlight ALEWarning
hi! link CocInfoHighlight ALEInfo
hi! link CocGitAddedSign GitGutterAdd
hi! link CocGitChangeRemovedSign GitGutterChangeDelete
hi! link CocGitChangedSign GitGutterChange
hi! link CocGitRemovedSign GitGutterDelete
hi! link CocGitTopRemovedSign GitGutterDelete

g:terminal_ansi_colors = [
  '#3B4252', '#BF616A', '#A3BE8C', '#EBCB8B',
  '#81A1C1', '#B48EAD', '#88C0D0', '#E5E9F0',
  '#4C566A', '#BF616A', '#A3BE8C', '#EBCB8B',
  '#81A1C1', '#B48EAD', '#8FBCBB', '#ECEFF4'
  ]
