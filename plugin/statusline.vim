scriptencoding utf-8

highlight User1 ctermbg=236 guibg=#111111 ctermfg=10  guifg=#207713 gui=NONE | " green
highlight User2 ctermbg=236 guibg=#111111 ctermfg=4   guifg=#136877 gui=NONE | " blue
highlight User3 ctermbg=9   guibg=#ff2c4b ctermfg=196 guifg=#d9cec3 gui=NONE | " red
highlight User4 ctermbg=236 guibg=#111111 ctermfg=251 guifg=#c5c5c5 gui=NONE | " white
highlight User5 ctermbg=237 guibg=#333333 ctermfg=251 guifg=#111111 gui=NONE | " white

autocmd MyAutoCmd WinEnter * setlocal statusline=%!functions#mystatusline('Enter')
autocmd MyAutoCmd WinLeave * setlocal statusline=%!functions#mystatusline('Leave')
set statusline=%!functions#mystatusline('Enter')
