" Filename: ftplugin/tex.vim

let s:save_cpo = &cpo
set cpo&vim

setlocal nosmartindent noautoindent
execute 'setlocal ' . (search("[^\x01-\x7e]", 'n') == 0 && line('$') > 5 ? '' : 'no') . 'spell'

let &cpo = s:save_cpo
unlet s:save_cpo
