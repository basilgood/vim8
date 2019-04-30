scriptencoding utf-8

function! s:pluginsPlug(plug_load) abort
  exec 'packadd'.' '.a:plug_load
endfunction

"""" vinegar
if !exists('g:loaded_vinegar')
  packadd vim-vinegar
endif

let g:netrw_localrmdir='rm -rf'
let g:netrw_bufsettings = 'nomodifiable nomodified number nowrap readonly nobuflisted hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile = 1
let g:netrw_home = $CACHE

function! InNetrw()
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> qq :bn<bar>bd#<cr>
endfunction

autocmd MyAutoCmd FileType netrw call InNetrw()

"""" buffergator
if !exists('g:did_buffergator')
  nnoremap <bs> :packadd vim-buffergator<cr>:BuffergatorToggle<cr>
else
  nnoremap <bs> :BuffergatorToggle<cr>
endif

let g:buffergator_suppress_keymaps = 1
let g:buffergator_viewport_split_policy = 'B'
let g:buffergator_autoupdate = 1
let g:buffergator_show_full_directory_path = 0

"""" editorconfig
if !exists('g:loaded_editorconfig')
  autocmd MyAutoCmd BufReadPre * packadd vim-editorconfig
endif
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1
let g:editorconfig_blacklist = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

"""" commentary
if !exists('g:loaded_commentary')
  autocmd MyAutoCmd BufRead * packadd vim-commentary
endif

"""" repeat
if !exists('g:loaded_repeat')
  autocmd MyAutoCmd BufRead * packadd vim-repeat
endif

"""" surround
if !exists('g:loaded_surround')
  autocmd MyAutoCmd BufRead * packadd vim-surround
endif

let surround_indent=1
nmap ss ysiw
nmap sl yss
vmap s S

"""" cmdline completion
if !exists('loaded_cmdline_completion')
  autocmd MyAutoCmd CmdlineEnter * packadd cmdline-completion
endif

"""" large file
if !exists('g:loaded_LargeFile')
  autocmd MyAutoCmd BufReadPre * packadd LargeFile
endif

"""" quickrun
if !exists('g:loaded_quickrun')
  autocmd MyAutoCmd BufRead * packadd vim-quickrun
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
  autocmd MyAutoCmd BufRead * packadd hlyank.vim
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
  autocmd MyAutoCmd BufRead * packadd starsearch.vim
endif

"""" tabular
if !exists('g:tabular_loaded')
  autocmd MyAutoCmd CmdlineEnter * packadd tabular
endif

"""" localrc
if !exists('g:loaded_localrc')
  autocmd MyAutoCmd BufRead * packadd vim-localrc
endif

"""" closetag
if !exists('g:loaded_closetag')
  autocmd MyAutoCmd BufRead * packadd vim-closetag
endif

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.twig,*.html.twig'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.twig,*.html.twig'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript,twig,html.twig'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript,twig,html.twig'

"""" gutentags
if !exists('g:loaded_gutentags')
  autocmd MyAutoCmd BufReadPre * packadd vim-gutentags
endif

let g:gutentags_cache_dir = $HOME .'/.cache/vim/guten_tags'
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_ctags_exclude_wildignore = 1
let g:gutentags_ctags_exclude = [
      \ '*/wp-admin', '*/wp-content', '*/wp-includes',
      \ '*/application/vendor', '*/vendor/ckeditor', '*/media/vendor'
      \ ]

"""" parenmatch
if !exists('g:loaded_parenmatch')
  autocmd MyAutoCmd BufRead * packadd vim-parenmatch
endif

"""" quickfix
if !exists('g:qf_modifiable')
  autocmd MyAutoCmd BufRead * packadd quickfix-reflector.vim
endif

"""" targets
if !exists('g:loaded_targets')
  autocmd MyAutoCmd BufRead * packadd targets.vim
endif

"""" traces
if !exists('g:loaded_traces_plugin')
  autocmd MyAutoCmd BufRead * packadd traces.vim
endif

"""" complimentary
if !exists('g:loaded_complimentary')
  autocmd MyAutoCmd BufRead * packadd vim-complimentary
endif

function! plugins#load() abort
endfunction
