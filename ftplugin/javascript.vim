scriptencoding utf-8
setlocal expandtab
" setlocal colorcolumn=81
" Use 2 space tabs for JavaScript
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell
" Include - for completion.
setlocal iskeyword+=-

let b:ale_linters = ['eslint', 'tsserver']
let g:ale_fixers = ['eslint']
let b:ale_javascript_eslint_options = '--ignore-pattern ''!.eslintrc.js'''
setlocal completeopt=menu,menuone,preview,noselect,noinsert
