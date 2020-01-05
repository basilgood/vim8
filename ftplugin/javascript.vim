scriptencoding utf-8

setlocal iskeyword+=-
setlocal suffixesadd+=.js
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)

packadd vim-html-template-literals
packadd vim-jsx-pretty
packadd vim-js

if executable('./node_modules/.bin/prettier')
  command! Format Dispatch! node_modules/.bin/prettier --single-quote --write %
else
  command! Format Dispatch! npx prettier --single-quote --write %
endif
