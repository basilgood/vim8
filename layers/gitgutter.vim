scriptencoding utf-8

if !exists('g:loaded_gutentags')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> functions#plug('vim-gutentags')}, {'repeat': 0})
endif

let g:gitgutter_grep_command = executable('ag') ? 'ag' : 'grep'
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed = '┃'
