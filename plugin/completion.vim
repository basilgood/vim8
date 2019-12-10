scriptencoding utf-8

" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#enable_camel_case = 1
" let g:neocomplete#auto_completion_start_length = 2
" let g#neocomplete#max_keyword_width=500
" let g:neocomplete#max_list = 500
" if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
" let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'

" autocmd vimRc InsertEnter * set iskeyword+=.
" autocmd vimRc InsertLeave * set iskeyword-=.
" let g:asyncomplete_smart_completion = 1
" let g:asyncomplete_auto_popup = 1
" augroup AsynC
"   autocmd!
"   autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
" augroup END
" augroup AsynCFile
"   autocmd!
"   autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"     \ 'name': 'file',
"     \ 'whitelist': ['*'],
"     \ 'priority': 10,
"     \ 'completor': function('asyncomplete#sources#file#completor')
"     \ }))
" augroup END
