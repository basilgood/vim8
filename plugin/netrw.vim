scriptencoding utf-8

let g:netrw_bufsettings         = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile             = 1
let g:netrw_dirhistmax          = 0

function! Innetrw() abort
  nnoremap <buffer> D <Nop>
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> J j<cr>
  nmap <buffer> K k<cr>
  nmap <buffer> qq :bn<bar>bd#<cr>
  nmap <buffer> D :terminal ++close rm -rf <c-r><c-l>
endfunction
autocmd vimRc FileType netrw call Innetrw()
