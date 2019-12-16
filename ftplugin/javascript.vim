scriptencoding utf-8

setlocal iskeyword+=-

let b:ale_linters = ['eslint', 'tsserver']
let b:ale_javascript_eslint_options = '--ignore-pattern ''!.eslintrc.js'''
let b:ale_fixers = ['eslint']

packadd vim-html-template-literals
packadd vim-jsx-pretty
packadd vim-js
