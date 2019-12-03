scriptencoding utf-8

let g:netrw_bufsettings         = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile             = 1
let g:netrw_dirhistmax          = 0

function! s:innetrw() abort
  nnoremap <buffer> D <Nop>
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> J j<cr>
  nmap <buffer> K k<cr>
  nmap <buffer> qq :bn<bar>bd#<cr>
  nmap <buffer> D !rm -rf
endfunction

augroup in_netrw
  autocmd!
  autocmd FileType netrw call s:innetrw()
augroup END
