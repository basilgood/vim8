" Filename: ftplugin/css.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal ofu=csscomplete#CompleteCSS
setlocal iskeyword=37,45,48-57,95,a-z,A-Z,192-255

let &cpo = s:save_cpo
unlet s:save_cpo
