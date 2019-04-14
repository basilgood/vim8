scriptencoding utf-8

let g:gitgutter_grep_command = executable('ag') ? 'ag' : 'grep'
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed = '┃'
let g:gitgutter_max_signs = 1000

autocmd MyAutoCmd BufRead * packadd vim-gitgutter
autocmd MyAutoCmd CursorHold,CursorHoldI * if !bufexists("[Command Line]") |call gitgutter#process_buffer(bufnr(''), 1)
