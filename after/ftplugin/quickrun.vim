" Filename: ftplugin/quickrun.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal nonumber tabstop=2 nolist

let &cpo = s:save_cpo
unlet s:save_cpo
