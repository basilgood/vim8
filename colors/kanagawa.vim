vim9script
# kanagawa colorscheme after kanagawa.nvim

set background=dark
highlight clear

if exists('syntax_on')
  syntax reset
endif

g:colors_name = 'kanagawa'

hi Normal       guifg=#DCD7BA guibg=#1F1F28 gui=NONE
hi EndOfBuffer  guifg=#54546D guibg=#1F1F28 gui=NONE

hi Identifier   guifg=#E6C384 guibg=NONE gui=NONE
hi Function     guifg=#7E9CD8 guibg=NONE gui=NONE

hi Comment      guifg=#727169 guibg=NONE gui=NONE
hi NonText      guifg=#54546D guibg=NONE gui=NONE
hi SpecialKey   guifg=#54546D guibg=NONE gui=NONE

hi Type         guifg=#98BB6C guibg=NONE gui=NONE
hi Directory    guifg=#98BB6C guibg=NONE gui=NONE
hi Tag          guifg=#98BB6C guibg=NONE gui=NONE
hi String       guifg=#98BB6C guibg=NONE gui=NONE

hi PreProc      guifg=#FFA066 guibg=NONE gui=NONE

hi Define       guifg=#957FB8 guibg=NONE gui=NONE
hi Label        guifg=#957FB8 guibg=NONE gui=NONE
hi Conditional  guifg=#957FB8 guibg=NONE gui=NONE
hi Statement    guifg=#957FB8 guibg=NONE gui=NONE
hi Question     guifg=#957FB8 guibg=NONE gui=NONE
hi Keyword      guifg=#957FB8 guibg=NONE gui=NONE
hi Character    guifg=#957FB8 guibg=NONE gui=NONE
hi StorageClass guifg=#957FB8 guibg=NONE gui=NONE
hi Structure    guifg=#957FB8 guibg=NONE gui=NONE
hi Operator     guifg=#C0A36E guibg=NONE gui=NONE
hi Special      guifg=#7FB4CA guibg=NONE gui=NONE
hi Delimiter    guifg=#7FB4CA guibg=NONE gui=NONE

hi Debug        guifg=#d75f87 guibg=NONE gui=NONE

hi Boolean      guifg=#D27E99 guibg=NONE gui=NONE
hi Float        guifg=#D27E99 guibg=NONE gui=NONE
hi Number       guifg=#D27E99 guibg=NONE gui=NONE
hi Constant     guifg=#D27E99 guibg=NONE gui=NONE
hi SpecialChar  guifg=#D27E99 guibg=NONE gui=NONE
hi MatchParen   guifg=#D27E99 guibg=NONE gui=NONE
hi Todo         guifg=#D27E99 guibg=NONE gui=NONE

hi Error        guifg=#E82424 guibg=NONE gui=NONE
hi ErrorMsg     guifg=#E82424 guibg=NONE gui=NONE
hi WarningMsg   guifg=#FF9E3B guibg=NONE gui=NONE

hi Search       guifg=NONE guibg=#223249 gui=NONE
hi IncSearch    guifg=NONE guibg=#223249 gui=NONE

hi DiffAdd     guibg=#2B3328 guifg=NONE      gui=NONE
hi DiffDelete  guibg=#43242B guifg=NONE      gui=NONE ctermfg=NONE
hi DiffChange  guibg=#49443C guifg=NONE      gui=NONE
hi DiffText    guibg=#213a59 guifg=NONE      gui=NONE
hi diffAdded   guibg=NONE    guifg=#76946A   gui=NONE
hi diffRemoved guibg=NONE    guifg=#B55E5E   gui=NONE
hi diffLine    guibg=#252535 guifg=NONE      gui=NONE
hi diffSubname guibg=NONE    guifg=#575921   gui=NONE

hi MsgArea      guifg=NONE guibg=#303030 gui=NONE
hi LineNr       guifg=#54546D guibg=#1F1F28 gui=NONE
hi CursorLineNr guifg=#938AA9 guibg=#1F1F28 gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#282835 gui=NONE
hi CursorColumn guifg=NONE guibg=#282835 gui=NONE
hi CursorLine guifg=NONE guibg=#282835 gui=NONE cterm=NONE
hi SignColumn   guifg=NONE guibg=#1F1F28

hi Visual guifg=NONE guibg=#282835 gui=NONE
hi QuickFixLine guifg=NONE guibg=#282835 gui=NONE

hi SpellBad     gui=underline guifg=NONE guibg=NONE
hi SpellBad     gui=underline guifg=NONE guibg=NONE
hi Underlined   guifg=NONE guibg=NONE gui=underline


hi VertSplit guifg=#1F1F28 guibg=#54546D gui=NONE
hi Folded guifg=#8e8eb3 guibg=#272738 gui=NONE
hi FoldColumn guifg=NONE guibg=#1F1F28 gui=NONE

hi StatusLine guifg=#16161D guibg=#9595bc gui=NONE
hi StatusLineNC guifg=#16161D guibg=#54546D gui=NONE
hi TabLine guifg=#9595bc guibg=#16161D gui=NONE cterm=NONE
hi TabLineSel guifg=#C8C093 guibg=#54546D gui=NONE cterm=NONE
hi TabLineFill guifg=NONE guibg=#1F1F28 gui=NONE cterm=NONE
hi Title        guifg=#717C7C guibg=NONE gui=bold

hi Pmenu guifg=#947D72 guibg=#33283f gui=NONE
hi PmenuSel guifg=#96A6CF guibg=#282835 gui=NONE
hi PmenuSbar guifg=#565687 guibg=#282835 gui=NONE
hi PmenuThumb guifg=NONE guibg=#282835 gui=NONE

hi GitGutterAdd guifg=#A3BE8C guibg=#1F1F28
hi GitGutterChange guifg=#EBCB8B guibg=#1F1F28
hi GitGutterChangeDelete guifg=#BF616A guibg=#1F1F28
hi GitGutterDelete guifg=#BF616A guibg=#1F1F28
hi ALEWarningSign guifg=#EBCB8B guibg=#1F1F28
hi ALEErrorSign guifg=#BF616A guibg=#1F1F28
hi CocErrorSign guifg=#BF616A
hi CocWarningSign guifg=#A3BE8C
hi CocInfoSign guifg=#A3BE8C
hi CocHintSign guifg=#81A1C1
hi CocFadeOut guifg=#BF616A
hi CocGitAddedSign guifg=#A3BE8C guibg=#1F1F28
hi CocGitChangedSign guifg=#EBCB8B guibg=#1F1F28
hi CocGitChangeRemovedSign guifg=#BF616A guibg=#1F1F28
hi CocGitRemovedSign guifg=#BF616A guibg=#1F1F28
hi link CocCodeLens Comment

g:terminal_ansi_colors = [
  '#3B4252', '#BF616A', '#A3BE8C', '#EBCB8B',
  '#81A1C1', '#B48EAD', '#88C0D0', '#E5E9F0',
  '#4C566A', '#BF616A', '#A3BE8C', '#EBCB8B',
  '#81A1C1', '#B48EAD', '#8FBCBB', '#ECEFF4'
  ]
