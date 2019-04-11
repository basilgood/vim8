scriptencoding utf-8

command! -nargs=+ Ack :call functions#vgrep(<q-args>)
nnoremap <M-f> :Ack<space>
