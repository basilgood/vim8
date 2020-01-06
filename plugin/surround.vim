scriptencoding utf-8

let g:surround_no_insert_mappings = 1
let surround_indent=1
nmap S ysiw
autocmd vimRc BufReadPost * packadd vim-surround
