scriptencoding utf-8

command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command! BD setlocal bufhidden=delete | bnext
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! -nargs=0 Nixfmt Dispatch! nixfmt %
command! -bang -nargs=* -complete=file Grep call functions#grep('grep<bang>',<q-args>)
