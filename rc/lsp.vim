scriptencoding utf-8

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 1
let g:asyncomplete_smart_completion = 1
nnoremap <silent> ]e  :LspNextError<CR>
nnoremap <silent> [e  :LspPreviousError<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR> pumvisible() ? asyncomplete#cancel_popup() : "\<CR>"
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

if executable('typescript-language-server')
  autocmd vimRc User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio',]},
        \ 'whitelist': ['javascript', 'typescript', 'typescriptreact'],
        \ })
    autocmd vimRc FileType javascript setlocal omnifunc=lsp#complete
endif

if executable('vim-language-server')
  autocmd vimRc User lsp_setup call lsp#register_server({
        \ 'name': 'vim-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'vim-language-server --stdio',]},
        \ 'whitelist': ['vim'],
        \ })
    autocmd vimRc FileType vim setlocal omnifunc=lsp#complete
endif

if executable('html-languageserver')
  autocmd vimRc User lsp_setup call lsp#register_server({
        \ 'name': 'html-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
        \ 'whitelist': ['html', 'html.twig', 'jinja.html'],
        \ })
    autocmd vimRc FileType html setlocal omnifunc=lsp#complete
endif

if executable('css-languageserver')
  autocmd vimRc User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio',]},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
    autocmd vimRc FileType scss setlocal omnifunc=lsp#complete
endif
