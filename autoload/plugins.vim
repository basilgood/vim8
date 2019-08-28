scriptencoding utf-8

"""" fugitive
function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zf :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd VGroup FileType fugitive call InFugitive()

"""" vinegar
if !exists('g:loaded_vinegar')
  packadd vim-vinegar
endif

let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile = 1
let g:netrw_home = $CACHE

function! InNetrw() abort
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> J j<cr>
  nmap <buffer> K k<cr>
  nmap <buffer> qq :bn<bar>bd#<cr>
  nmap <buffer> qd .terminal ++close rm -rf
  nmap <buffer> qt .terminal ++close touch
endfunction

autocmd VGroup FileType netrw call InNetrw()

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
nmap S ysiw
nmap sl yss

"""" cmdline completion
if !exists('loaded_cmdline_completion')
  autocmd VGroup CmdlineEnter * packadd cmdline-completion
endif

"""" hlyank
if !exists('g:loaded_hlyank_plugin')
  packadd hlyank.vim
endif

"""" undotree
if !exists('g:loaded_undotree')
  nnoremap <leader>u :packadd undotree<cr>:UndotreeToggle<cr>
else
  nnoremap <leader>u :UndotreeToggle<cr>
endif

let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

"""" easy align
if !exists('g:loaded_easy_align_plugin')
  packadd vim-easy-align
endif
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

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
autocmd VGroup CmdlineEnter * packadd  vim-stay
autocmd VGroup BufNewFile,BufRead */.git/addp-hunk-edit.diff let b:stay_ignore = 1

"""" fzf
autocmd VGroup CmdlineEnter * packadd fzf | packadd fzf.vim
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
let g:mergetool_layout = 'bmr'

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
call submode#enter_with('scroll-h', 'n', '', 'zl', 'zl')
call submode#enter_with('scroll-h', 'n', '', 'zh', 'zh')
call submode#enter_with('scroll-h', 'n', '', 'zL', 'zL')
call submode#enter_with('scroll-h', 'n', '', 'zH', 'zH')
call submode#map('scroll-h', 'n', '', 'l', 'zl')
call submode#map('scroll-h', 'n', '', 'h', 'zh')
call submode#map('scroll-h', 'n', '', 'L', 'zL')
call submode#map('scroll-h', 'n', '', 'H', 'zH')

""" git
autocmd VGroup CmdlineEnter * packadd vim-git
nnoremap <buffer> <silent> S :Cycle<CR>

"""" rebase diff
if !exists('g:did_auto_git_diff')
  packadd auto-git-diff
endif

"""" gv
if exists('g:loaded_fugitive')
  packadd gv.vim
endif

"""" dispatch
if !exists('g:loaded_dispatch')
  packadd vim-dispatch
endif

"""" cool
if !exists('g:loaded_cool')
  packadd vim-cool
endif
let g:CoolTotalMatches = 1

"""" html indent
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'
let g:html_indent_autotags = 'html'

"""" parens
if !exists('g:loaded_pear_tree')
  autocmd VGroup BufRead * packadd pear-tree
endif

let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
imap jk <Plug>(PearTreeFinishExpansion)
imap <space> <Plug>(PearTreeSpace)

"""" expand region
if !exists('g:expand_region_init')
  autocmd VGroup BufRead * packadd vim-expand-region
endif

let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ip'  :1,
      \ 'ie'  :1,
      \ 'a]'  :1,
      \ 'ab'  :1,
      \ 'aB'  :1,
      \ }

"""" yankstack
if !exists('g:yankstack_yank_keys')
  let g:yankstack_yank_keys = ['c', 'C', 'd', 'D', 'x', 'X', 'y', 'Y']
  packadd vim-yankstack
endif

nmap p <Plug>yankstack_substitute_older_paste
nmap P <Plug>yankstack_substitute_newer_paste

"""" autoformat
autocmd VGroup CmdlineEnter * packadd vim-autoformat

"""" ags
if !exists('g:ags_loaded')
  autocmd VGroup CmdlineEnter * packadd vim-ags
endif
let g:ags_winplace = 'right'

""""
if !exists('g:loaded_completor_plugin')
  autocmd VGroup BufRead * packadd completor.vim
  autocmd VGroup BufRead * packadd completor-dictionary
  autocmd VGroup BufRead * packadd neoinclude.vim
endif

let g:completor_set_options = 1
let g:completor_auto_close_doc = 1
let g:completor_completion_delay = 200
let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
let g:completor_scss_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
let g:completor_html_omni_trigger = '<?.*$'
let g:completor_php_omni_trigger = '([$\w]+|use\s*|->[$\w]*|::[$\w]*|implements\s*|extends\s*|class\s+[$\w]+|new\s*)$'
let g:completor_javascript_omni_trigger = "\\w+$|[\\w\\)\\]\\}\'\"]+\\.\\w*$"
let g:completor_rust_binary = 'racer'
let g:completor_javascript_prettier_binary = $PWD .'/node_modules/.bin/prettier'
let g:completor_nix_nixfmt_binary = 'nixfmt'

nnoremap <silent> <leader>d :call completor#do('definition')<CR>
nnoremap <silent> <leader>c :call completor#do('doc')<CR>
nnoremap <silent> <leader>f :call completor#do('format')<CR>
nnoremap <silent> <leader>s :call completor#do('hover')<CR>

function! plugins#load() abort
endfunction
