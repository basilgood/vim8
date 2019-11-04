scriptencoding utf-8

call add(g:plugins.opt, $GITHUB_COM.'w0rp/ale')

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_set_highlights = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
let g:ale_code_actions_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_set_balloons = 1
let g:ale_sign_warning = '_w'
let g:ale_sign_error = '_e'
let g:ale_sign_info = 'ℹ'
let g:ale_echo_msg_error_str='(e)'
let g:ale_echo_msg_info_str='(i)'
let g:ale_echo_msg_warning_str='(w)'
let g:ale_echo_msg_format = '%linter%: %s %severity%'
let g:ale_pattern_options_enabled = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_pattern_options = {
      \ '\.min\.(js\|css)$': {
      \     'ale_linters': [],
      \     'ale_fixers': []
      \ },
      \ 'jquery.*': {
      \     'ale_linters': [],
      \     'ale_fixers': []
      \ },
      \ 'node_modules/.*': {
      \     'ale_linters': [],
      \     'ale_fixers': []
      \ },
      \ 'package.json': {
      \     'ale_fixers': []
      \ },
      \}
let g:ale_fixers = {
      \ 'css':        ['prettier'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tslint'],
      \ 'json':       ['prettier'],
      \ 'scss':       ['prettier'],
      \ 'yml':        ['prettier'],
      \ 'html':       ['eslint'],
      \ 'rust':       ['rustfmt']
      \}
" let g:ale_linter_aliases = {'html': ['html', 'javascript']}
let g:ale_linters = {
      \ 'javascript': ['eslint', 'tsserver'],
      \ 'typescript': ['tslint', 'tsserver'],
      \ 'rust':       ['rls', 'cargo','rustc'],
      \ 'vim':        ['vint', 'vim-language-server'],
      \ 'nix':        ['nix'],
      \}

nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)
nnoremap gD :ALEGoToDefinition<cr>
nnoremap gD :ALEFindReferences<cr>
nnoremap gO :ALEOrganizeImports<cr>
nnoremap K :ALEHover<cr>
