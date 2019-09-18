" Filename: ftplugin/html.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell

let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'
let g:html_indent_autotags = 'html'

setlocal omnifunc=htmlcomplete#CompleteTags

let &cpo = s:save_cpo
unlet s:save_cpo
