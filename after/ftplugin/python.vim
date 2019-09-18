" Filename: ftplugin/python.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal ofu=jedi#completions

let &cpo = s:save_cpo
unlet s:save_cpo
