scriptencoding utf-8

let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_altfile             = 1
nmap <buffer> <right> <cr>
nmap <buffer> <left> -
nmap <buffer> gq :bn<bar>bd#<cr>
nmap <buffer> D .!rm -rf
hi netrwPlain ctermfg=145
