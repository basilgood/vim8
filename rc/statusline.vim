scriptencoding utf-8

let &g:statusline=''
let &g:statusline.=' %{winnr("$")>1?winnr():""}'
let &g:statusline.=' %{toupper(mode())}'
let &g:statusline.=' ⦁ %{expand("%:f")}'
let &g:statusline.=' %h%r'
let &g:statusline.='%{exists("g:loaded_fugitive")?"⦁ ".fugitive#head(5):""} '
let &g:statusline.=' %#incsearch#%{&mod?" ✚✚✚ ":""}'
let &g:statusline.='%*'
let &g:statusline.='%='
let &g:statusline.='%{&filetype!=#""?&filetype:""} ⦁'
let &g:statusline.='%12(%c:%l/%L%) '
set laststatus=2
