scriptencoding utf-8

command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command! BD setlocal bufhidden=delete | bnext
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! -nargs=0 HL call functions#hl()
command! -range GB echo join(systemlist("git blame -L <line1>,<line2> " . expand('%')), "\n")
command! OpenChangedFiles :call functions#changedfiles()
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

function! commands#commands() abort
endfunction
