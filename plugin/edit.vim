scriptencoding utf-8

Plugin 'sgur/vim-editorconfig'
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}
call timer_start(300, {-> vivid#enable('vim-editorconfig')}, {'repeat': 0})

Plugin 'tpope/vim-repeat'
call timer_start(300, {-> vivid#enable('vim-repeat')}, {'repeat': 0})

Plugin 'tpope/vim-surround'
call timer_start(300, {-> vivid#enable('vim-surround')}, {'repeat': 0})
let surround_indent=1
nmap S ysiw
nmap sl yss

Plugin 'tomtom/tcomment_vim'
call timer_start(300, {-> vivid#enable('tcomment_vim')}, {'repeat': 0})

Plugin 'markonm/traces.vim'
call timer_start(300, {-> vivid#enable('traces.vim')}, {'repeat': 0})

Plugin 'sgur/cmdline-completion'
autocmd VGroup CmdlineEnter * call vivid#enable('cmdline-completion')

Plugin 'markonm/hlyank.vim'
call timer_start(300, {-> vivid#enable('hlyank.vim')}, {'repeat': 0})

Plugin 'mbbill/undotree', { 'command': ['UndotreeToggle'] }
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
nnoremap <leader>u :UndotreeToggle<cr>

Plugin 'junegunn/vim-easy-align'
nmap ga :call vivid#enable('vim-easy-align')<cr> <bar> <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

Plugin 'embear/vim-localvimrc', { 'command': ['LocalVimRC'] }

Plugin 'itchyny/vim-parenmatch'
autocmd VGroup BufRead * call vivid#enable('vim-parenmatch')

Plugin 'wellle/targets.vim'
call timer_start(300, {-> vivid#enable('targets.vim')}, {'repeat': 0})
