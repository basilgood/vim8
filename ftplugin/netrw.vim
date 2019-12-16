scriptencoding utf-8

let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_altfile             = 1
let g:netrw_dirhistmax          = 0
let g:netrw_banner = 0
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_list_hide='^\./$,^\../$'

setlocal bufhidden=delete

nmap <buffer> <right> <cr>
nmap <buffer> <left> -
nmap <buffer> J j<cr>
nmap <buffer> K k<cr>
nmap <buffer> qq :bn<bar>bd#<cr>
nmap <buffer> . :!rm -rf<space>
nmap <buffer> ! :!
xmap <buffer> ! :!
