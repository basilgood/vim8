scriptencoding utf-8

let g:lsc_server_commands = {
      \  'javascript': {
      \    'command': 'typescript-language-server --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'typescript': {
      \    'command': 'typescript-language-server --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'vim': {
      \    'command': 'vim-language-server --stdio',
      \    'log_level': -1,
      \    'suppress_stderr': v:true,
      \  },
      \  'html': {
      \    'command': 'html-languageserver --stdio',
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
      \  }
      \}

highlight lscDiagnosticError   ctermfg=203
highlight lscDiagnosticWarning ctermfg=215
highlight lscDiagnosticHint    ctermfg=142
highlight lscDiagnosticInfo    ctermfg=228
highlight link lscReference         CursorColumn
highlight link lscCurrentParameter  CursorColumn

let g:lsc_auto_map = {
    \ 'GoToDefinition': 'gd',
    \ 'FindReferences': '<Space>r',
    \ 'FindImplementations': '<Space>i',
    \ 'FindCodeActions': '<Space>a',
    \ 'Rename': '<F2>',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': '<Space>v',
    \ 'WorkspaceSymbol': '<Space><S-v>',
    \ 'SignatureHelp': '<Space>m',
    \ 'Completion': 'omnifunc',
    \}

let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:true
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'
