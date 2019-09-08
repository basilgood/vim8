scriptencoding utf-8

setlocal expandtab
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal nospell

" Include - for completion.
setlocal iskeyword+=-

let b:ale_linters = ['eslint', 'tsserver']
let b:ale_fixers = ['eslint']
" let b:ale_fix_on_save = 1
" autocmd AutoCmd *.js,.jsx call LanguageClient_textdocument_formatting()
" autocmd AutoCmd BufWrite * call LanguageClient_textDocument_formatting()
let b:ale_javascript_eslint_options = '--ignore-pattern ''!.eslintrc.js'''
setlocal completeopt=menu,menuone,preview,noselect,noinsert
let b:formatters_javascript = ['prettier']
