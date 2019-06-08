scriptencoding utf-8

"""" vinegar
if !exists('g:loaded_vinegar')
  packadd vim-vinegar
endif

let g:netrw_localrmdir='rm -rf'
let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile = 1
let g:netrw_home = $CACHE

function! InNetrw()
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> J j<cr>
  nmap <buffer> K k<cr>
  nmap <buffer> qq :bn<bar>bd#<cr>
  nmap <buffer> ,d !rm -rf
  nmap <buffer> ,t !touch
endfunction

autocmd MyAutoCmd FileType netrw call InNetrw()

"""" editorconfig
if !exists('g:loaded_editorconfig')
  packadd vim-editorconfig
endif
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1
let g:editorconfig_blacklist = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

"""" commentary
if !exists('g:loaded_commentary')
  packadd vim-commentary
endif

"""" repeat
if !exists('g:loaded_repeat')
  packadd vim-repeat
endif

"""" surround
if !exists('g:loaded_surround')
  packadd vim-surround
endif

let surround_indent=1
nmap ss ysiw
nmap sl yss
vmap s S

"""" cmdline completion
if !exists('loaded_cmdline_completion')
  autocmd MyAutoCmd CmdlineEnter * packadd cmdline-completion
endif

"""" quickrun
if !exists('g:loaded_quickrun')
  packadd vim-quickrun
endif

let g:quickrun_config = {
      \'_': {
      \'runner': 'job',
      \'outputter' : 'error',
      \'outputter/error/success' : 'buffer',
      \'outputter/error/error'   : 'quickfix',
      \'outputter/quickfix/open_cmd' : 'copen',
      \'outputter/buffer/split' : ':botright 8sp',
      \'outputter/buffer/close_on_empty': 1,
      \'hook/quickfix_status_enable/enable_exit' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/enable' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/enable_exit' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/priority_exit' : -10,
      \},
      \}

"""" hlyank
if !exists('g:loaded_hlyank_plugin')
  packadd hlyank.vim
endif

"""" undotree
if !exists('g:loaded_undotree')
  nnoremap U :packadd undotree<cr>:UndotreeToggle<cr>
else
  nnoremap U :UndotreeToggle<cr>
endif

let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

"""" cmdline ranges
if !exists('g:loaded_cmdline_ranges')
  autocmd MyAutoCmd CmdlineEnter * packadd vim-cmdline-ranges
endif

"""" starsearch
if !exists('g:loaded_starsearch')
  packadd starsearch.vim
endif

"""" spotlightify
if !exists('g:loaded_spotlightify')
  packadd vim-spotlightify
endif
let g:splfy_setmaps = 0
nmap cx <Plug>(spotlightify)searchreplacefwd
nnoremap <leader><leader> :Nohls<cr>

"""" tabular
if !exists('g:tabular_loaded')
  autocmd MyAutoCmd CmdlineEnter * packadd tabular
endif

"""" localrc
if !exists('g:loaded_localrc')
  packadd vim-localrc
endif

"""" closetag
if !exists('g:loaded_closetag')
  packadd vim-closetag
endif

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.twig,*.html.twig'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.twig,*.html.twig'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript,twig,html.twig'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript,twig,html.twig'

"""" parenmatch
if !exists('g:loaded_parenmatch')
  packadd vim-parenmatch
endif

"""" quickfix
if !exists('g:qf_modifiable')
  packadd quickfix-reflector.vim
endif

"""" targets
if !exists('g:loaded_targets')
  packadd targets.vim
endif

"""" traces
if !exists('g:loaded_traces_plugin')
  packadd traces.vim
endif

"""" smooth scroll
if !exists('loaded_smooth_scroll')
  packadd vim-smooth-scroll
endif

"""" git rebase ft
autocmd MyAutoCmd CmdlineEnter * packadd vim-git
nnoremap <buffer> <silent> S :Cycle<CR>

"""" rebase diff
if !exists('g:did_auto_git_diff')
  packadd auto-git-diff
endif

"""" asyncrun
if !exists('g:asyncrun_silent')
  packadd asyncrun.vim
endif

"""" stay
autocmd MyAutoCmd CmdlineEnter * packadd  vim-stay

"""" fzf
autocmd MyAutoCmd CmdlineEnter * packadd fzf | packadd fzf.vim
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>
nnoremap <leader>f :FF!<cr>
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

"""" mergetool
if !exists('g:loaded_mergetool')
  packadd vim-mergetool
endif

" possible values: 'local' (default), 'remote', 'base'
let g:mergetool_prefer_revision = 'local'
" (m) - for working tree version of merged file
" (r) - for 'remote' revision
" (l) - for 'local' revision
let g:mergetool_layout = 'mr'

nmap <leader>gm <plug>(MergetoolToggle)
cabbrev dp diffput
cabbrev dg diffget

"""" submode
call submode#enter_with('resize', 'n', '', '<C-W>>', '<C-W>>')
call submode#enter_with('resize', 'n', '', '<C-W><', '<C-W><')
call submode#leave_with('resize', 'n', '', '<Esc>')
call submode#map('resize', 'n', '', '.', '<C-W>>')
call submode#map('resize', 'n', '', ',', '<C-W><')

function! plugins#load() abort
endfunction
