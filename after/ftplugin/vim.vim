  call ale#linter#Define('vim', {
  \   'name': 'vim-language-server',
  \   'lsp': 'stdio',
  \   'executable': 'vim-language-server',
  \   'command': '%e --stdio',
  \   'project_root': '',
  \})
