scriptencoding utf-8

" dein
let g:dein#auto_recache = 1
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('neoclide/coc.nvim', { 'build': 'yarn install --frozen-lockfile', 'merged': 0 })
  call dein#add('neoclide/coc-eslint', { 'build': 'yarn install --frozen-lockfile', 'merged': 0 })
  call dein#add('neoclide/coc-git', { 'build': 'yarn install --frozen-lockfile', 'merged': 0 })
  call dein#add('tpope/vim-vinegar', {
        \ 'lazy' : 1,
        \ 'on_map': {'n': '-'}
        \ })
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('sgur/vim-editorconfig', {
        \ 'lazy': 1,
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('tpope/vim-fugitive', {
        \ 'lazy': 1,
        \ 'on_event': 'BufReadPost',
        \ })
  call dein#add('tpope/vim-dispatch', {
        \ 'lazy': 1,
        \ 'on_cmd': ['Dispatch', 'Make', 'Start']
        \ })
  call dein#add('tpope/vim-surround', {
        \ 'lazy' : 1,
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('tpope/vim-repeat')
  call dein#add('tomtom/tcomment_vim', {
        \ 'lazy' : 1,
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('wellle/targets.vim', {
        \ 'lazy' : 1,
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('markonm/hlyank.vim', {
        \ 'lazy' : 1,
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('fcpg/vim-altscreen')
  call dein#add('markonm/traces.vim', {
        \ 'lazy' : 1,
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('junegunn/vim-easy-align',{
        \ 'lazy' : 1,
        \ 'on_map': '<Plug>(EasyAlign)',
        \ 'on_cmd': 'EasyAlign'
        \ })
  call dein#add('stefandtw/quickfix-reflector.vim', {
        \ 'on_ft': 'qf'
        \ })
  call dein#add('mbbill/undotree', {
        \ 'lazy' : 1,
        \ 'on_cmd': 'UndotreeToggle'
        \ })
  call dein#add('samoshkin/vim-mergetool', {
        \ 'lazy' : 1,
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('da-x/conflict-marker.vim', {
        \ 'lazy' : 1,
        \ 'on_event': 'BufReadPost'
        \ })
  call dein#add('hotwatermorning/auto-git-diff', {
        \ 'on_ft': 'gitrebase'
        \ })
  call dein#add('pangloss/vim-javascript', {
        \ 'on_ft': 'javascript'
        \ })
  call dein#add('jonsmithers/vim-html-template-literals', {
        \ 'branch': 'dev',
        \ 'on_ft': 'javascript',
        \ 'hook_add': 'let g:htl_all_templates = 1'
        \ })
  call dein#add('LnL7/vim-nix', {
        \ 'on_ft': 'nix'
        \ })
  call dein#add('digitaltoad/vim-pug', {
        \ 'on_ft': 'pug'
        \ })
  call dein#add('dNitro/vim-pug-complete', {
        \ 'on_ft': 'pug'
        \ })
  call dein#add('rhysd/vim-fixjson', {
        \ 'on_ft': 'json'
        \ })
  call dein#add('kchmck/vim-coffee-script', {
        \ 'on_ft': 'coffee'
        \ })
  call dein#add('plasticboy/vim-markdown', {
        \ 'on_ft': 'markdown'
        \ })
  call dein#add('lepture/vim-jinja', {
        \ 'on_ft': 'jinja'
        \ })
  call dein#add('lumiliet/vim-twig', {
        \ 'on_ft': 'twig'
        \ })

  call dein#end()
  call dein#save_state()
endif

if !has('vim_starting') && dein#check_install()
  call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

filetype plugin indent on
