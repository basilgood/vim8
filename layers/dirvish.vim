scriptencoding utf-8

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

function! s:setup_dirvish()
  if &buftype !=# 'nofile' && &filetype !=#'dirvish'
    return
  endif
  let text = getline('.')
  if ! get(g:, 'dirvish_hide_visible', 1)
    exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
  endif
  exec 'sort ,^.*[\/],'
  let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
  call search(name, 'wc')
  nmap <silent><buffer> <left> -
  nmap <silent><buffer> <right> <cr>
endfunc

autocmd MyAutoCmd FileType dirvish call s:setup_dirvish()
