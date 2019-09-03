scriptencoding utf-8

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell

setlocal formatoptions=croql
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",b:\\

highlight Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey guifg=#484848
autocmd VGroup BufReadPre,BufWinEnter *.vim setlocal conceallevel=2 concealcursor=nv
autocmd VGroup BufReadPre,BufWinEnter *.vim syntax match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
