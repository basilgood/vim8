scriptencoding utf-8

autocmd! vimRc User lsp_setup call lsp#register_server({
      \   'name': 'diagnostic-languageserver',
      \   'cmd': { info -> ['diagnostic-languageserver', '--stdio'] },
      \   'whitelist': [
      \     'typescript',
      \     'typescript.tsx',
      \     'typescriptreact',
      \     'javascript',
      \     'javascript.jsx',
      \     'javascriptreact',
      \     'html',
      \     'nix',
      \   ],
      \   'initialization_options': {
      \     'linters': {
      \       'eslint': {
      \         'sourceName': 'eslint',
      \         'command': 'eslint_d',
      \         'args': ['--stdin', '--stdin-filename=%filename', '--no-color'],
      \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
      \         'formatLines': 1,
      \         'formatPattern': [
      \           '^\s*(\d+):(\d+)\s+([^ ]+)\s+(.*?)\s+([^ ]+)$',
      \           {
      \             'line': 1,
      \             'column': 2,
      \             'message': [4, ' [', 5, ']' ],
      \             'security': 3
      \           }
      \         ],
      \         'securities': {
      \            'error': 'error',
      \            'warning': 'warning'
      \         },
      \       },
      \     },
      \     'filetypes': {
      \       'javascript': 'eslint',
      \       'javascript.tsx': 'eslint',
      \       'javascriptreact': 'eslint',
      \       'typescript': 'eslint',
      \       'typescript.tsx': 'eslint',
      \       'typescriptreact': 'eslint',
      \       'html': 'eslint',
      \       'nix': 'nix-instantiate',
      \     },
      \     'formatters': {
      \       'eslint': {
      \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
      \         'command': 'eslint_d',
      \         'args': ['--fix', '--fix-to-stdout', '--stdin', '--stdin-filename=%filename'],
      \         'isStdout': v:true,
      \         'isStderr': v:true,
      \       }
      \     },
      \     'formatFiletypes': {
      \       'javascript': 'eslint',
      \       'javascript.tsx': 'eslint',
      \       'javascriptreact': 'eslint',
      \       'typescript': 'eslint',
      \       'typescript.tsx': 'eslint',
      \       'typescriptreact': 'eslint',
      \       'html': 'eslint'
      \     }
      \   }
      \ })
