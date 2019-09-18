" Filename: ftplugin/xml.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal ofu=xmlcomplete#CompleteTags

let &cpo = s:save_cpo
unlet s:save_cpo
