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
nmap gcc :call vivid#enable('tcomment_vim')<cr> <Plug>TComment_<c-_><c-_>
vmap gc :call vivid#enable('tcomment_vim')<cr> <Plug>TComment_<c-_><c-_>

Plugin 'markonm/traces.vim'
nnoremap ss :call vivid#enable('traces.vim')<cr>:%s/
nnoremap sl :call vivid#enable('traces.vim')<cr>:s/
nnoremap sr :call vivid#enable('traces.vim')<cr>:s/\<<C-r><C-w>\>/
vnoremap s :call vivid#enable('traces.vim')<cr>:s/
nnoremap sa :call vivid#enable('traces.vim')<cr>:%s/\<<c-r><c-w>\>/<c-r><c-w>
nnoremap sp :call vivid#enable('traces.vim')<cr> vip :s/
nnoremap sw :call vivid#enable('traces.vim')<cr>:%s/\<<cr><c-w>\>/

Plugin 'sgur/cmdline-completion'
autocmd vimRc CmdlineEnter * call vivid#enable('cmdline-completion')

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
autocmd vimRc BufRead * call vivid#enable('vim-parenmatch')

Plugin 'wellle/targets.vim'
call timer_start(300, {-> vivid#enable('targets.vim')}, {'repeat': 0})
