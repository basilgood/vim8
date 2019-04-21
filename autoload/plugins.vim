scriptencoding utf-8

function! s:pluginsPlug(plug_load) abort
  exec 'packadd'.' '.a:plug_load
endfunction

"""" vinegar
autocmd MyAutoCmd BufWinEnter * call timer_start(300, {-> s:pluginsPlug('vim-vinegar')}, {'repeat': 0})

let g:netrw_localrmdir='rm -rf'
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile = 1
let g:netrw_home = $CACHE

function! InNetrw()
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
endfunction

autocmd MyAutoCmd FileType netrw call InNetrw()

"""" buffergator
nnoremap <bs> :packadd vim-buffergator<cr>:BuffergatorToggle<cr>

let g:buffergator_suppress_keymaps = 1
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_autoupdate = 1
let g:buffergator_show_full_directory_path = 0

"""" editorconfig
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1
let g:editorconfig_blacklist = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

"""" fugitive
function! s:load_fugitive()
  if exists('b:git_dir')
    call pluginsPlug('vim-fugitive')
    autocmd! load_fugitive
    call fugitive#detect(expand('%:p'))
  endif
endfunction
augroup load_fugitive
  au!
  au BufWinEnter * packadd vim-fugitive
augroup END

"""" commentary
if !exists('g:loaded_commentary')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('vim-commentary')}, {'repeat': 0})
endif

"""" repeat
if !exists('g:loaded_repeat')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('vim-repeat')}, {'repeat': 0})
endif

"""" surround
if !exists('g:loaded_surround')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('vim-surround')}, {'repeat': 0})
endif

let surround_indent=1
nmap ss ysiw
nmap sl yss
vmap s S

"""' cool
if !exists('g:CoolTotalMatches')
  autocmd MyAutoCmd CmdlineEnter * call s:pluginsPlug('vim-cool')
endif
let g:CoolTotalMatches = 1

"""" cmdline completion
if !exists('loaded_cmdline_completion')
  autocmd MyAutoCmd CmdlineEnter * call s:pluginsPlug('cmdline-completion')
endif

"""" large file
if !exists('g:loaded_LargeFile')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('LargeFile')}, {'repeat': 0})
endif

"""" quickrun
if !exists('g:loaded_quickrun')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('vim-quickrun')}, {'repeat': 0})
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
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('hlyank.vim')}, {'repeat': 0})
endif

"""" undotree
if !exists('g:loaded_undotree')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('undotree')}, {'repeat': 0})
endif

let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

nnoremap U :UndotreeToggle<cr>

"""" cmdline ranges
autocmd MyAutoCmd CmdlineEnter * call s:pluginsPlug('vim-cmdline-ranges')

"""" starsearch
if !exists('g:loaded_starsearch')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('starsearch.vim')}, {'repeat': 0})
endif

"""" exchange
if !exists('g:exchange_no_mappings')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('vim-exchange')}, {'repeat': 0})
endif

"""" tabular
if !exists('g:tabular_loaded')
  autocmd MyAutoCmd CmdlineEnter * call s:pluginsPlug('tabular')
endif

"""" localrc
if !exists('g:loaded_localrc')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('vim-localrc')}, {'repeat': 0})
endif

"""" closetag
if !exists('g:loaded_closetag')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('vim-closetag')}, {'repeat': 0})
endif

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,.*twig'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,.*js,.*twig'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript,twig'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript,twig'

"""" fuzee
nnoremap <leader><leader> :packadd vim-fuzzee<cr>:F */

"""" gutentags
if !exists('g:loaded_gutentags')
  autocmd MyAutoCmd BufEnter * call timer_start(300, {-> s:pluginsPlug('vim-gutentags')}, {'repeat': 0})
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

"""" gitgutter
if &filetype !=? 'netrw'
  call timer_start(300, {-> s:pluginsPlug('vim-gitgutter')}, {'repeat': 0})
  autocmd MyAutoCmd CursorHold,CursorHoldI * call gitgutter#all(1)
endif

let g:gitgutter_grep_command = executable('ag') ? 'ag' : 'grep'
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '┃'
let g:gitgutter_sign_removed_first_line = '┃'
let g:gitgutter_sign_modified_removed = '┃'
let g:gitgutter_max_signs = 1000

"""" parenmatch
if !exists('g:loaded_gutentags')
  autocmd MyAutoCmd BufWinEnter * call timer_start(300, {-> s:pluginsPlug('vim-parenmatch')}, {'repeat': 0})
endif

"""" quickfix
if !exists('g:qf_modifiable')
  autocmd MyAutoCmd BufRead * call timer_start(300, {-> s:pluginsPlug('quickfix-reflector.vim')}, {'repeat': 0})
endif

"""" targets
if !exists('g:loaded_targets')
  autocmd MyAutoCmd BufRead * packadd targets.vim
endif

"""" langs
autocmd MyAutoCmd BufRead,BufNewFile *.js,.jsx packadd vim-jsx-improve
let g:jsx_ext_required = 0

autocmd MyAutoCmd BufRead,BufNewFile *.md,.markdown packadd vim-markdown
let g:markdown_fenced_languages = ['html', 'vim', 'javascript', 'python', 'bash=sh']

autocmd MyAutoCmd BufRead,BufNewFile *.jinja,.jinja2 packadd vim-jinja
autocmd MyAutoCmd BufRead,BufNewFile *.twig packadd vim-twig
autocmd MyAutoCmd BufRead,BufNewFile *.coffee packadd vim-coffee-script
autocmd MyAutoCmd BufRead,BufNewFile *.ts,tsx packadd tscompletejob

function! plugins#load() abort
endfunction
