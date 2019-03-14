scriptencoding utf-8

nnoremap - :Vaffle %:p:h<cr>
let g:vaffle_force_delete = 1
let g:vaffle_show_hidden_files = 1
function! s:customize_vaffle_mappings() abort
  nmap <buffer> <Left>  <Plug>(vaffle-open-parent)
  nmap <buffer> <Right> <Plug>(vaffle-open-current)
  setlocal relativenumber
endfunction

 augroup vimrc_vaffle
  autocmd!
  autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END
