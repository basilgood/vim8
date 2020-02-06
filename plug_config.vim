scriptencoding utf-8

if dein#tap('vim-lsc')
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
        \  'nix': {
        \    'command': 'rnix-lsp',
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

  let g:lsc_auto_map = {
        \ 'GoToDefinition': 'gd',
        \ 'FindReferences': '<Space>r',
        \ 'FindImplementations': '<Space>i',
        \ 'FindCodeActions': '<Space>a',
        \ 'Rename': '<F2>',
        \ 'ShowHover': v:true,
        \ 'DocumentSymbol': '<Space>x',
        \ 'WorkspaceSymbol': '<Space><S-v>',
        \ 'SignatureHelp': '<Space>m',
        \ 'Completion': 'omnifunc',
        \}

  let g:lsc_enable_autocomplete  = v:true
  let g:lsc_enable_diagnostics   = v:true
  let g:lsc_reference_highlights = v:false
  let g:lsc_trace_level          = 'off'
endif

if dein#tap('LanguageClient-neovim')
  let g:LanguageClient_serverCommands = {
        \ 'nix': ['rnix-lsp'],
        \ 'javascript': ['typescript-language-server', '--stdio'],
        \ 'typescript': ['typescript-language-server', '--stdio'],
        \ 'vim': ['vim-language-server', '--stdio'],
        \ }
  nnoremap <F5> :call LanguageClient_contextMenu()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  set formatexpr=LanguageClient_textDocument_rangeFormatting()
  set omnifunc=LanguageClient#complete
endif

" if dein#tap('completor.vim')
"   let g:completor_refresh_always = 0
"   let g:completor_nix_omni_trigger = "\\w+$|[\\w\\)\\]\\}\'\"]+\\.\\w*$"
"   let g:completor_javascript_omni_trigger = "\\w+$|[\\w\\)\\]\\}\'\"]+\\.\\w*$"
"   let g:completor_vim_omni_trigger = "\\w+$|[\\w\\)\\]\\}\'\"]+\\.\\w*$"
"   let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
"   let g:completor_scss_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
"   let g:completor_html_omni_trigger = '(<[$\w]*|<\/[$\w]*)$'
"   let g:completor_xml_omni_trigger = '(<[$\w]*|<\/[$\w]*)$'
"   let g:completor_php_omni_trigger = '([$\w]{2,}|use\s*|->[$\w]*|::[$\w]*|implements\s*|extends\s*|class\s+[$\w]+|new\s*)$'
"   let g:completor_ruby_omni_trigger = '(\.[$\w]*|::[$\w]*)$'
"   let g:completor_node_binary = '/home/vasy/.nix-profile/bin/node'
"   " let g:completor_filetype_map = {}
"   " let g:completor_filetype_map.javascript = {'ft': 'lsp', 'cmd': 'typescript-language-server --stdio'}
"   " let g:completor_filetype_map.vim = {'ft': 'lsp', 'cmd': 'vim-language-server --stdio'}
" endif

if dein#tap('ale')
  let g:ale_set_signs = 1
  let g:ale_set_highlights = 0
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1
  let g:ale_lint_delay = 0
  let g:ale_sign_info = '_i'
  let g:ale_sign_error = '_e'
  let g:ale_sign_warning = '_w'
  let g:ale_set_balloons = 1
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_eslint_executable = 'eslint_d'
  let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
  let g:ale_echo_msg_format = '%linter%: %s %severity%'
  let g:ale_linters = {
        \ 'jsx': ['eslint'],
        \ 'javascript': ['eslint'],
        \ 'typescript': ['eslint'],
        \ 'rust': ['rls'],
        \ 'html': 'all',
        \ 'css': 'all',
        \ 'json': 'all',
        \ 'xml': 'all',
        \ }
  let g:ale_fixers = {
        \ 'javascript': ['prettier', 'eslint'],
        \ 'html': ['prettier', 'eslint'],
        \ 'yaml': ['prettier'],
        \ 'nix': ['nixpkgs-fmt']
        \ }

  nnoremap [a :ALEPreviousWrap<CR>
  nnoremap ]a :ALENextWrap<CR>
endif

if dein#tap('fzf.vim')
  let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  let g:fzf_layout = { 'down': '~25%' }
  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-v': 'vsplit',
        \ 'ctrl-w': 'bdelete'}
  nnoremap <c-p> :Files<cr>
  nnoremap <c-h> :Files %:h<cr>
  nnoremap <bs> :Buffers<cr>
endif

if dein#tap('vim-vinegar')
  let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
  let g:netrw_altfile             = 1
  let g:netrw_home='~/.cache/vim/cache/'
  autocmd vimRc FileType netrw call functions#innetrw()
endif

if dein#tap('vim-surround')
  let g:surround_no_insert_mappings = 1
  let surround_indent = 1
  nmap S ysiw
endif

if dein#tap('vim-gitgutter')
  " let g:gitgutter_sign_priority = 5
  nmap ghs <Plug>(GitGutterStageHunk)
  nmap ghu <Plug>(GitGutterUndoHunk)
  nmap ghp <Plug>(GitGutterPreviewHunk)
endif

if dein#tap('vim-editorconfig')
  let g:editorconfig_root_chdir = 1
  let g:editorconfig_verbose    = 1
  let g:editorconfig_blacklist  = {
        \ 'filetype': ['git.*', 'fugitive'],
        \ 'pattern': ['\.un~$']}
endif

if dein#tap('vim-fugitive')
  nnoremap [git]  <Nop>
  nmap <space>g [git]
  nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
  nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>

  function! InFugitive() abort
    nmap <buffer> zp :<c-u>Dispatch! git push<CR>
    nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
  endfunction

  autocmd vimRc FileType fugitive call InFugitive()
endif

if dein#tap('vim-easy-align')
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
endif

if dein#tap('undotree')
  let g:undotree_CustomUndotreeCmd = 'vertical 50 new'
  let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_ShortIndicators = 1
endif

if dein#tap('SimpleAutoComplPop')
  autocmd vimRc FileType pug call sacp#enableForThisBuffer({ "matches": [
        \ { '=~': '\v[a-zA-Z]{1}$' , 'feedkeys': "\<C-x>\<C-o>"} ,
        \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-n>"} ,
        \ ]
        \ })
  autocmd vimRc FileType nix call sacp#enableForThisBuffer({ "matches": [
        \ { '=~': '\v[a-zA-Z]{2}$' , 'feedkeys': "\<C-x>\<C-n>"} ,
        \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-n>"} ,
        \ ]
        \ })
  autocmd vimRc FileType scss,css call sacp#enableForThisBuffer({ "matches": [
        \ { '=~': '\v[a-zA-Z]{2}$' , 'feedkeys': "\<C-x>\<C-o>"} ,
        \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-o>"} ,
        \ { '=~': '\: $'           , 'feedkeys': "\<C-x>\<C-o>"} ,
        \ ]
        \ })
endif
