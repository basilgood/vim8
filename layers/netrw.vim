scriptencoding utf-8

let g:netrw_localrmdir='rm -rf' 
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile = 1

function! InNetrw()
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
endfunction

autocmd MyAutoCmd FileType netrw call InNetrw()
