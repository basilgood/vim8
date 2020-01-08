scriptencoding utf-8

setlocal iskeyword+=-
setlocal suffixesadd+=.js
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)

packadd vim-html-template-literals
packadd vim-jsx-pretty
packadd vim-js

let b:dispatch = 'make'
setlocal makeprg=eslint
autocmd vimRc BufWritePost <buffer> Make! --fix %
