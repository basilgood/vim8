scriptencoding utf-8

if executable('typescript-language-server')
  augroup LspTS
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'ts',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
      \ 'whitelist': ['typescript', 'typescript.tsx']
      \ })
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'js',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx']
      \ })
    autocmd FileType javascript setlocal omnifunc=lsp#complete
    autocmd FileType javascript.jsx setlocal omnifunc=lsp#complete
    autocmd FileType typescript setlocal omnifunc=lsp#complete
    autocmd FileType typescript.tsx setlocal omnifunc=lsp#complete
  augroup END
endif

if executable('vim-language-server')
  augroup LspVi
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'viml',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'vim-language-server --stdio']},
          \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
          \ 'whitelist': ['vim']
          \ })
    autocmd FileType vim setlocal omnifunc=lsp#complete
  augroup END
endif

nnoremap [lsp] <Nop>
nmap <space>l [lsp]
vmap <space>l [lsp]
nnoremap [lsp]a :<C-u>LspCodeAction<CR>
nnoremap [lsp]D :<C-u>LspDeclaration<CR>
nnoremap [lsp]d :<C-u>LspDefinition<CR>
nnoremap [lsp]q :<C-u>LspDocumentDiagnostics<CR>
nnoremap [lsp]r :<C-u>LspRename<CR>
nnoremap [lsp]R :<C-u>LspReferences<CR>
nnoremap [lsp]p :<C-u>LspPreviousError<CR>
nnoremap [lsp]n :<C-u>LspNextError<CR>
nnoremap [lsp]f :<C-u>LspDocumentFormat<CR>
vnoremap [lsp]f :<C-u>LspDocumentRangeFormat<CR>
nnoremap [lsp]t :<C-u>LspTypeDefinition<CR>
nnoremap [lsp]h :<C-u>LspHover<CR>
nnoremap [lsp]s :<C-u>LspDocumentSymbol<CR>
nnoremap [lsp]S :<C-u>LspWorkspaceSymbol<CR>
nnoremap [lsp]? :<C-u>LspStatus<CR>
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
