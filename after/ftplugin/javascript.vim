" Filename: ftplugin/javascript.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell

setlocal ofu=js#CompleteJS shiftwidth=2

let b:ale_linters = ['eslint', 'tsserver']
let b:ale_fixers = ['eslint', 'tsserver']

let &cpo = s:save_cpo
unlet s:save_cpo
