scriptencoding utf-8

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

highlight Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey guifg=#484848
autocmd VGroup BufReadPre,BufWinEnter *.yml setlocal conceallevel=2 concealcursor=nv
autocmd VGroup BufReadPre,BufWinEnter *.yml syntax match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
