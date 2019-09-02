scriptencoding utf-8

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell

setlocal formatoptions=croql
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",b:\\
highlight Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey guifg=#5c6370
autocmd VGroup BufWinEnter * setlocal conceallevel=2 concealcursor=nv
autocmd VGroup BufWinEnter * syntax match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
autocmd VGroup BufReadPre * setlocal conceallevel=2 concealcursor=nv
autocmd VGroup BufReadPre * syntax match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
