" Filename: ftplugin/perl.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal shiftwidth=2

let &cpo = s:save_cpo
unlet s:save_cpo
