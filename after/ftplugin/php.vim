" Filename: ftplugin/php.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal ofu=phpcomplete#CompletePHP

let &cpo = s:save_cpo
unlet s:save_cpo
