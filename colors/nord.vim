" nord colorscheme
" after nordan colorscheme

highlight clear
syntax reset

set background=dark
let g:colors_name = 'nord'

hi Normal guifg=#cdcecf guibg=#2E3440
hi NonText guifg=#4C566A guibg=NONE
hi SpecialKey guifg=#4C566A guibg=NONE
hi Comment guifg=#4C566A guibg=NONE
hi VertSplit guifg=#2E3440 guibg=#4C566A
hi Special guifg=#B48EAD guibg=NONE
hi Constant guifg=#B48EAD guibg=NONE
hi Identifier guifg=#81A1C1 guibg=NONE
hi Statement guifg=#81A1C1 guibg=NONE
hi PreProc guifg=#B48EAD guibg=NONE
hi Type guifg=#81A1C1 guibg=NONE
hi String guifg=#A3BE8C guibg=NONE
hi Function guifg=#88C0D0 guibg=NONE
hi Error guifg=#BF616A guibg=NONE
hi ErrorMsg guifg=#BF616A guibg=NONE
hi WarningMsg guifg=#BF616A guibg=NONE
hi ModeMsg guifg=#5E81AC guibg=NONE
hi MoreMsg guifg=#5E81AC guibg=NONE
hi Underlined guifg=#8FBCBB guibg=NONE
hi Question guifg=#8FBCBB guibg=NONE
hi Search guifg=#8FBCBB guibg=#434C5E
hi Visual guifg=NONE guibg=#434C5E
hi LineNr guifg=#434C5E guibg=NONE
hi CursorLineNr guifg=#cdcecf guibg=#4C566A cterm=NONE
hi SignColumn guifg=NONE guibg=#434C5E
hi Folded guifg=#81A1C1 guibg=#434C5E
hi FoldColumn guifg=#88C0D0 guibg=#434C5E
hi StatusLine guifg=#4C566A guibg=#cdcecf
hi StatusLineNC guifg=#434C5E guibg=#81A1C1
hi TabLine guifg=#2E3440 guibg=#4C566A gui=NONE cterm=NONE
hi TabLineFill guifg=#4C566A guibg=#2E3440 gui=NONE
hi TabLineSel guifg=#B48EAD guibg=#2E3440 gui=NONE
hi Title guifg=#DDC085 guibg=NONE
hi CursorLine guifg=NONE guibg=#434C5E cterm=NONE
hi CursorColumn guifg=NONE guibg=#434C5E cterm=NONE
hi ColorColumn guifg=NONE guibg=#434C5E
hi Directory guifg=#81A1C1 guibg=NONE
hi Conceal guifg=#B48EAD guibg=NONE
hi MatchParen guibg=#4C566A
hi Pmenu guifg=#cdcecf guibg=#434C5E
hi PmenuSel guifg=#4C566A guibg=#81A1C1
hi PmenuSbar guifg=#cdcecf guibg=#3B4252
hi DiffAdd guifg=NONE guibg=#3B4252
hi DiffChange guifg=#E5E9F0 guibg=#3B4252
hi DiffDelete guifg=#3B4252 guibg=#BF616A
hi DiffText guifg=#E5E9F0 guibg=#5E81AC
hi diffAdded guifg=#A3BE8C guibg=#2E3440
hi diffRemoved guifg=#BF616A guibg=#2E3440
hi GitGutterAdd guifg=#A3BE8C guibg=#434C5E
hi GitGutterChange guifg=#EBCB8B guibg=#434C5E
hi GitGutterChangeDelete guifg=#BF616A guibg=#434C5E
hi GitGutterDelete guifg=#BF616A guibg=#434C5E
hi ALEWarningSign guifg=#EBCB8B guibg=#434C5E
hi ALEErrorSign guifg=#BF616A guibg=#434C5E
hi CocErrorSign guifg=#BF616A
hi CocWarningSign guifg=#A3BE8C
hi CocInfoSign guifg=#A3BE8C
hi CocHintSign guifg=#81A1C1
hi CocFadeOut guifg=#BF616A
hi CocGitAddedSign guifg=#A3BE8C guibg=#434C5E
hi CocGitChangedSign guifg=#EBCB8B guibg=#434C5E
hi CocGitChangeRemovedSign guifg=#BF616A guibg=#434C5E
hi CocGitRemovedSign guifg=#BF616A guibg=#434C5E

let g:terminal_ansi_colors = [
      \'#3B4252', '#BF616A', '#A3BE8C', '#EBCB8B',
      \'#81A1C1', '#B48EAD', '#88C0D0', '#E5E9F0',
      \'#4C566A', '#BF616A', '#A3BE8C', '#EBCB8B',
      \'#81A1C1', '#B48EAD', '#8FBCBB', '#ECEFF4'
      \]
