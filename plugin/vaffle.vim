scriptencoding utf-8

nnoremap - :Vaffle<cr>
let g:vaffle_force_delete = 1
let g:vaffle_show_hidden_files = 1
function! s:customize_vaffle_mappings() abort
  nmap <buffer> <left> <Plug>(vaffle-open-parent)|
  nmap <buffer> <right> <Plug>(vaffle-open-current)
  nmap <buffer> % <Plug>(vaffle-new-file)
endfunction

augroup vimrc_vaffle
  autocmd!
  autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END
