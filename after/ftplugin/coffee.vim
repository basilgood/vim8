" Filename: ftplugin/coffee.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal ofu=js#CompleteJS nospell

let &cpo = s:save_cpo
unlet s:save_cpo
