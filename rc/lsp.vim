scriptencoding utf-8

call add(g:plugins.start, $GITHUB_COM.'natebosch/vim-lsc')
let g:lsc_server_commands = {
      \  'javascript': {
      \    'command': ('typescript-language-server --stdio'),
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'typescript': {
      \    'command': ('typescript-language-server --stdio'),
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'sh': {
      \    'command': 'bash-language-server start',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'css': {
      \    'command': 'css-languageserver --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'scss': {
      \    'command': 'css-languageserver --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'html': {
      \    'command': 'html-languageserver --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'twig': {
      \    'command': 'html-languageserver --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'html.twig': {
      \    'command': 'html-languageserver --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  }
      \}
let g:lsc_auto_map = {
      \ 'GoToDefinition': 'gn',
      \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
      \ 'FindReferences': 'gr',
      \ 'NextReference': '<C-Down>',
      \ 'PreviousReference': '<C-Up>',
      \ 'FindImplementations': 'gI',
      \ 'FindCodeActions': 'ga',
      \ 'Rename': 'gR',
      \ 'ShowHover': v:true,
      \ 'DocumentSymbol': 'go',
      \ 'WorkspaceSymbol': 'gS',
      \ 'SignatureHelp': 'gm',
      \ 'Completion': 'omnifunc',
      \}
let g:lsc_enable_autocomplete = v:false
" let g:lsc_autocomplete_length = 2
" let g:lsc_enable_diagnostics   = v:true
let g:lsc_reference_highlights = v:true
let g:lsc_hover_popup = v:true
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
