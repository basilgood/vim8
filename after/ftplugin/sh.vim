" Filename: ftplugin/sh.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal iskeyword=36,45,48-57,64,95,a-z,A-Z,192-255

let &cpo = s:save_cpo
unlet s:save_cpo
