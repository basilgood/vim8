scriptencoding utf-8

" vinegar
autocmd vimRc VimEnter * packadd vim-vinegar

" leaderf
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_ShortcutB = '<bs>'
let g:Lf_WindowHeight = 0.25
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewHorizontalPosition = 'center'
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}

nnoremap <silent> <C-p> :packadd LeaderF<cr>:LeaderfFile<cr>
nnoremap <silent> <C-h> :LeaderfHistoryCmd<cr>

" fugitive
nnoremap [git]  <Nop>
nmap <space>g [git]
nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd vimRc FileType fugitive call InFugitive()
autocmd vimRc BufReadPre * packadd vim-fugitive

" ale
nnoremap [a :ALEPreviousWrap<CR>
nnoremap ]a :ALENextWrap<CR>

" let g:ale_completion_enabled = 1
" set omnifunc=ale#completion#OmniFunc
" let g:ale_code_actions_enabled = 1
" let g:ale_sign_info = '_i'
" let g:ale_sign_error = '_e'
" let g:ale_sign_warning = '_w'
" let g:ale_lint_on_text_changed = 'normal'
" let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_save = 1
" let g:ale_fix_on_save = 1
" let g:ale_lint_delay = 0
" let g:ale_warn_about_trailing_whitespace = 0
" let g:ale_set_balloons = 1
" let g:ale_linters_explicit = 1  " run only linters explicitly configured
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

let g:ale_fixers = {
      \   'javascript': ['prettier'],
      \   'html': ['prettier'],
      \   'yaml': ['prettier'],
      \   'nix': ['nixpkgs-fmt']
      \}

let g:ale_linters = {}
      " \ 'javascript':  ['tsserver', 'eslint'],
      " \ 'javascript.jsx':  ['eslint'],
      " \ 'typescript': ['tsserver', 'eslint'],
      " \ 'typescript.tsx':  ['eslint'],
      " \ 'vim': ['vint'],
      " \ 'yaml': ['yamllint'],
      " \}

autocmd vimRc BufReadPost * packadd ale

" gitgutter
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added              = '|'
let g:gitgutter_sign_modified           = '|'

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

autocmd vimRc VimEnter * packadd vim-gitgutter

" editorconfig
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}
autocmd vimRc BufReadPre * packadd vim-editorconfig

" dispatch
autocmd vimRc VimEnter * packadd vim-dispatch

" surround
let g:surround_no_insert_mappings = 1
let surround_indent=1
nmap S ysiw
autocmd vimRc BufReadPost * packadd vim-surround

" tcomment
autocmd vimRc BufReadPost * packadd tcomment_vim

" traces
autocmd vimRc BufReadPost * packadd traces.vim

" hlyank
autocmd vimRc BufReadPost * packadd hlyank.vim

" easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
autocmd vimRc BufReadPost * packadd vim-easy-align

" conflict-marker
autocmd vimRc BufReadPost * packadd conflict-marker.vim

" mergetool
let g:mergetool_layout = 'bmr'
autocmd vimRc BufReadPost * packadd vim-mergetool

" targets
autocmd vimRc BufReadPost * packadd targets.vim

" quickfix
autocmd vimRc VimEnter * packadd quickfix-reflector.vim

" nix
autocmd vimRc BufReadPre *.nix packadd vim-nix
