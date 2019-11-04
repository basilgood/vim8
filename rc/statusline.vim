scriptencoding utf-8

let &g:statusline=''
let &g:statusline.='%{expand("%:p:h:t")}/%t'
let &g:statusline.='%8c:%l'
let &g:statusline.=' %h%r'
" let &g:statusline.='%{exists("g:did_coc_loaded")?coc#status():""}'
let &g:statusline.='%{exists("g:LanguageClient_serverCommands")?LanguageClient#serverStatus():""}'
let &g:statusline.=' %#incsearch#%{&mod?" ✚✚✚ ":""}'
let &g:statusline.='%*'
let &g:statusline.='%='
let &g:statusline.='%{exists("g:loaded_fugitive")?fugitive#head(5):""} '
let &g:statusline.='[%{&filetype!=#""?&filetype:""}]'
set laststatus=2
