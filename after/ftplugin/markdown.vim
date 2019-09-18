" Filename: ftplugin/markdown.vim

let s:save_cpo = &cpo
set cpo&vim

let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh', 'nix']

setlocal nosmartindent noautoindent
execute 'setlocal ' . (search("[^\x01-\x7e]", 'n') == 0 && line('$') > 5 ? '' : 'no') . 'spell'

let &cpo = s:save_cpo
unlet s:save_cpo
