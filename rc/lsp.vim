scriptencoding utf-8

" call add(g:plugins.start, '-b next '.$GITHUB_COM.'autozimu/LanguageClient-neovim')
" call add(g:plugins.start, $GITHUB_COM.'natebosch/vim-lsc')
call add(g:plugins.opt, $GITHUB_COM.'prabirshrestha/async.vim')
call add(g:plugins.opt, $GITHUB_COM.'prabirshrestha/vim-lsp')
call add(g:plugins.opt, $GITHUB_COM.'asyncomplete-lsp.vim')
" let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_enabled = 0
let g:lsp_highlight_references_enabled = 1
let g:lsp_signs_enabled = 0

nmap <silent> K <plug>(lsp-hover)
nmap gd <plug>(lsp-definition)

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
        \ 'whitelist': ['javascript', 'typescript', 'html'],
        \ })
    autocmd FileType javascript setlocal omnifunc=lsp#complete
endif
" let g:lsc_server_commands = {
"  \  'javascript': {
"  \    'command': ('typescript-language-server --stdio'),
"  \    'log_level': -1,
"  \    'suppress_stderr': v:true,
"  \  },
"  \  'typescript': {
"  \    'command': 'typescript-language-server --stdio',
"  \    'log_level': -1,
"  \    'suppress_stderr': v:true,
"  \  },
"  \  'sh': {
"  \    'command': 'bash-language-server start',
"  \    'log_level': -1,
"  \    'suppress_stderr': v:true,
"  \  },
"  \  'css': {
"  \    'command': 'css-language-server --stdio',
"  \    'log_level': -1,
"  \    'suppress_stderr': v:true,
"  \  },
"  \  'scss': {
"  \    'command': 'css-language-server --stdio',
"  \    'log_level': -1,
"  \    'suppress_stderr': v:true,
"  \  },
"  \  'js': {
"  \    'command': 'css-language-server --stdio',
"  \    'log_level': -1,
"  \    'suppress_stderr': v:true,
"  \  }
"  \}
" let g:lsc_auto_map = {
"  \  'GoToDefinition': 'gd',
"  \  'FindReferences': 'gr',
"  \  'Rename': 'gR',
"  \  'ShowHover': 'K',
"  \  'Completion': 'omnifunc',
"  \}
" let g:lsc_enable_autocomplete  = v:true
" let g:lsc_enable_diagnostics   = v:false
" let g:lsc_reference_highlights = v:false
" let g:lsc_trace_level          = 'off'

" let g:LanguageClient_serverCommands = {}

" if executable('typescript-language-server')
"   let g:LanguageClient_serverCommands['javascript'] = [exepath('typescript-language-server'), '--stdio']
" endif

" if executable('html-languageserver')
"   let g:LanguageClient_serverCommands['html'] = [exepath('html-languageserver'), '--stdio']
" endif

" if executable('css-languageserver')
"   let g:LanguageClient_serverCommands['css'] = [exepath('css-languageserver'), '--stdio']
" endif

" if executable('rls')
"   let g:LanguageClient_serverCommands['rust'] = ['rustup', 'run', 'stable', 'rls']
" endif

" if executable('pyls')
"   let g:LanguageClient_serverCommands['python'] = ['pyls']
" elseif !empty($PYLS_EXECUTABLE)
"   let s:pyls = expand($PYLS_EXECUTABLE)
"   if executable(s:pyls)
"     let g:LanguageClient_serverCommands['python'] = [s:pyls]
"   endif
" endif

" if executable('docker-langserver')
"   let g:LanguageClient_serverCommands['dockerfile'] = [&shell, &shellcmdflag, 'docker-langserver --stdio']
" endif

" if executable('gopls')
"   let g:LanguageClient_serverCommands['go'] = ['gopls']
" endif

" if executable('bash-language-server')
"   let g:LanguageClient_serverCommands['sh'] = [exepath('bash-language-server'), 'start']
" endif

" function LC_maps()
"   if has_key(g:LanguageClient_serverCommands, &filetype)
"     nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"     nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"     nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"     nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"   endif
" endfunction
" autocmd FileType * call LC_maps()
