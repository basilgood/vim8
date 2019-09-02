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
let b:ale_fixers = ['eslint']
" let b:ale_fix_on_save = 1
" autocmd VGroup *.js,.jsx call LanguageClient_textdocument_formatting()
" autocmd VGroup BufWrite * call LanguageClient_textDocument_formatting()
let b:ale_javascript_eslint_options = '--ignore-pattern ''!.eslintrc.js'''
setlocal completeopt=menu,menuone,preview,noselect,noinsert
let b:formatters_javascript = ['prettier']

highlight Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGrey guifg=#5c6370
autocmd VGroup BufWinEnter * setlocal conceallevel=2 concealcursor=nv
autocmd VGroup BufWinEnter * syntax match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
autocmd VGroup BufReadPre * setlocal conceallevel=2 concealcursor=nv
autocmd VGroup BufReadPre * syntax match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=·
