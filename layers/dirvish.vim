scriptencoding utf-8

let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

function! s:setup_dirvish()
  if &buftype !=# 'nofile' && &filetype !=#'dirvish'
    return
  endif
  let text = getline('.')
  if ! get(g:, 'dirvish_hide_visible', 1)
    exec 'silent keeppatterns g@\v[\/]\.[^\/]+[\/]?$@d _'
  endif
  exec 'sort|sort ,^.*[\/],'
  let name = '^' . escape(text, '.*[]~\') . '[/*|@=|\\*]\=\%($\|\s\+\)'
  call search(name, 'wc')
  nmap <silent><buffer> <left> -
  nmap <silent><buffer> <right> <cr>
endfunc

autocmd MyAutoCmd FileType dirvish call s:setup_dirvish()
