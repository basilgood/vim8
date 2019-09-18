" Filename: ftplugin/json.vim

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal formatoptions=a2tq

let b:ale_fix_on_save = 1
let b:ale_fixers = ['fixjson']
