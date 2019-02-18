scriptencoding utf-8

set background=dark
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
silent! colorscheme gruvbox8_hard
hi StatusLine cterm=reverse gui=reverse ctermfg=14 ctermbg=8 guifg=#3b3f3f guibg=#ffffff
hi StatusLineNC cterm=reverse gui=reverse ctermfg=11 ctermbg=0 guifg=#3e4647 guibg=#073642
hi User1 ctermfg=14 ctermbg=0 guifg=#3b3f3f guibg=#262730
highlight IsModified ctermbg=237 ctermfg=160
hi MatchParen ctermbg=NONE guibg=NONE ctermfg=175 guifg=#d3869b cterm=NONE gui=NONE
