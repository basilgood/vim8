scriptencoding utf-8

let g:find_files_command_name = 'Find'
let g:find_files_findprg = 'find $d ! -type d $*'
let g:find_files_buf_command = "enew"
if !empty(g:find_files_command_name)
  exe "command! -nargs=* -bang " . g:find_files_command_name . " :call find_files#execute(<q-args>, 'qf', <bang>0)"
endif
