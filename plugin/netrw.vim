let g:netrw_localrmdir='rm -r'

function! KeysInNetrw()
  nmap <buffer> <Right> <CR>
  nmap <buffer> <Left> -
  nmap <buffer> l qf
endfunction

augroup vimrcNetrw
  autocmd!
  autocmd FileType netrw call KeysInNetrw()
augroup End
