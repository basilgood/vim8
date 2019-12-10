scriptencoding utf-8

let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_altfile             = 1
let g:netrw_dirhistmax          = 0
let g:netrw_banner = 0
let g:netrw_sort_sequence = '[\/]$,*'
nmap - :call Opendir('edit')<CR>
function! Opendir(cmd) abort
  if expand('%') =~# '^$\|^term:[\/][\/]'
    execute a:cmd '.'
  else
    execute a:cmd '%:h'
    let pattern = '^\%(| \)*'.escape(expand('#:t'), '.*[]~\').'[/*|@=]\=\%($\|\t\)'
    call search(pattern, 'wc')
  endif
endfunction

function! s:innetrw() abort
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> J j<cr>
  nmap <buffer> K k<cr>
  nmap <buffer> qq :bn<bar>bd#<cr>
  nmap <buffer> . :!rm -rf<space>
  nmap <buffer> ! :!
  xmap <buffer> ! :!
endfunction

augroup in_netrw
  autocmd!
  autocmd FileType netrw call s:innetrw()
augroup END
