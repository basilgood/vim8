scriptencoding utf-8

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

autocmd VGroup BufWinEnter *.json setlocal conceallevel=0 concealcursor=
autocmd VGroup BufReadPre *.json setlocal conceallevel=0 concealcursor=

let b:ale_fix_on_save = 1
let b:ale_fixers = ['fixjson']