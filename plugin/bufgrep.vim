scriptencoding utf-8

command! -nargs=+ Bck :call functions#bgrep(<q-args>)
nnoremap <M-b> :Bck<space>
