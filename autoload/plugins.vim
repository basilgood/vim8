scriptencoding utf-8

"""" vinegar
if !exists('g:loaded_vinegar')
  packadd vim-vinegar
endif

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
  nmap <buffer> qd .terminal ++close rm -rf
  nmap <buffer> qt .terminal ++close touch
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

if !exists('loaded_tcomment')
  packadd tcomment_vim
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

"""" hlyank
if !exists('g:loaded_hlyank_plugin')
  packadd hlyank.vim
endif

"""" arpeggio
if !exists('g:loaded_arpeggio')
  packadd vim-arpeggio
endif

let g:arpeggio_timeoutlen=220
call arpeggio#map('n', '', 0, 'vv', 'viw')
call arpeggio#map('n', '', 0, '\1', '1<C-w>w')
call arpeggio#map('n', '', 0, '\2', '2<C-w>w')
call arpeggio#map('n', '', 0, '\3', '3<C-w>w')
call arpeggio#map('n', '', 0, '\4', '4<C-w>w')
call arpeggio#map('n', '', 0, '\5', '5<C-w>w')
call arpeggio#map('n', '', 0, '\6', '6<C-w>w')
call arpeggio#map('n', '', 0, '\7', '7<C-w>w')
call arpeggio#map('n', '', 0, '\8', '8<C-w>w')
call arpeggio#map('n', '', 0, '\9', '9<C-w>w')
call arpeggio#map('n', '', 0, ';;', ':')

"""" undotree
if !exists('g:loaded_undotree')
  nnoremap <leader>u :packadd undotree<cr>:UndotreeToggle<cr>
else
  nnoremap <leader>u :UndotreeToggle<cr>
endif

let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

"""" tabular
if !exists('g:tabular_loaded')
  autocmd MyAutoCmd CmdlineEnter * packadd tabular
endif

nnoremap <tab><tab> :Tabularize /
xnoremap <tab><tab> :Tabularize /

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

"""" stay
autocmd MyAutoCmd CmdlineEnter * packadd  vim-stay
autocmd MyAutoCmd BufNewFile,BufRead */.git/addp-hunk-edit.diff let b:stay_ignore = 1

"""" fzf
autocmd MyAutoCmd CmdlineEnter * packadd fzf | packadd fzf.vim
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>

let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
let g:fzf_layout = { 'down': '~35%' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-w': 'bdelete'}
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
nmap <leader>gm <plug>(MergetoolToggle)

"""" submode
call submode#enter_with('resize', 'n', '', '<C-W>>', '<C-W>>')
call submode#enter_with('resize', 'n', '', '<C-W><', '<C-W><')
call submode#map('resize', 'n', '', '.', '<C-W>>')
call submode#map('resize', 'n', '', ',', '<C-W><')
call submode#enter_with('resize', 'n', '', '<C-W>-', '<C-W>-')
call submode#enter_with('resize', 'n', '', '<C-W>+', '<C-W>+')
call submode#map('resize', 'n', '', '-', '<C-W>-')
call submode#map('resize', 'n', '', '=', '<C-W>+')
call submode#leave_with('resize', 'n', '', '<Esc>')

""" git
autocmd MyAutoCmd CmdlineEnter * packadd vim-git
nnoremap <buffer> <silent> S :Cycle<CR>

"""" rebase diff
if !exists('g:did_auto_git_diff')
  packadd auto-git-diff
endif

"""" gv
if exists('g:loaded_fugitive')
  packadd gv.vim
endif

"""" asyncrun
if !exists('g:loaded_dispatch')
  packadd vim-dispatch
endif

"""" cool
if !exists('g:loaded_cool')
  packadd vim-cool
endif
let g:CoolTotalMatches = 1

function! plugins#load() abort
endfunction
