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
  let g:lsc_enable_diagnostics   = v:false
  let g:lsc_reference_highlights = v:false
  let g:lsc_trace_level          = 'off'
endif

if dein#tap('ale')
  let g:ale_set_signs = 1
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1
  let g:ale_lint_delay = 0
  let g:ale_code_actions_enabled = 1
  let g:ale_sign_info = '_i'
  let g:ale_sign_error = '_e'
  let g:ale_sign_warning = '_w'
  let g:ale_set_balloons = 1
  let g:ale_javascript_eslint_use_global = 1
  let g:ale_javascript_eslint_executable = 'eslint_d'
  let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
  let g:ale_echo_msg_format = '%linter%: %s %severity%'
  let g:ale_linters = {
        \   'jsx': ['eslint'],
        \   'javascript': ['eslint'],
        \   'typescript': ['eslint'],
        \}
  let g:ale_fixers = {
        \   'javascript': ['prettier', 'eslint'],
        \   'html': ['prettier', 'eslint'],
        \   'yaml': ['prettier'],
        \   'nix': ['nixpkgs-fmt']
        \}

  nnoremap [a :ALEPreviousWrap<CR>
  nnoremap ]a :ALENextWrap<CR>
endif

if dein#tap('LeaderF')
  let g:Lf_ShortcutF = '<C-p>'
  let g:Lf_ShortcutB = '<BS>'
  let g:Lf_WindowHeight = 0.25
  let g:Lf_PreviewInPopup = 1
  let g:Lf_PreviewHorizontalPosition = 'center'
  let g:Lf_CursorBlink = 0
  let g:Lf_ShowHidden = 1
  let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
  let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
endif

if dein#tap('vim-vinegar')
  let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
  let g:netrw_altfile             = 1
  autocmd vimRc FileType netrw call functions#innetrw()
endif

if dein#tap('vim-surround')
  let g:surround_no_insert_mappings = 1
  let surround_indent=1
  nmap S ysiw
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

if dein#tap('SimpleAutoComplPop')
  autocmd vimRc FileType pug call sacp#enableForThisBuffer({ "matches": [
        \ { '=~': '\v[a-zA-Z]{2}$' , 'feedkeys': "\<C-x>\<C-o>"} ,
        \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-n>"} ,
        \ ]
        \ })
  autocmd vimRc FileType nix call sacp#enableForThisBuffer({ "matches": [
        \ { '=~': '\v[a-zA-Z]{2}$' , 'feedkeys': "\<C-x>\<C-n>"} ,
        \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-n>"} ,
        \ ]
        \ })
endif
