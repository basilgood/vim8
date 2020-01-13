scriptencoding utf-8

setlocal iskeyword+=-
setlocal suffixesadd+=.js
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)

packadd vim-html-template-literals
packadd vim-jsx-improve
" packadd vim-javascript

let g:htl_all_templates = 1
let g:htl_css_templates = 1
