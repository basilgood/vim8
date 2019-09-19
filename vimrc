" Init. {{{1
set encoding=utf-8
scriptencoding utf-8

if &compatible | set nocompatible | endif

let skip_defaults_vim=1

augroup vimRc
 autocmd!
augroup END

if has('vim_starting') && has('reltime')
  let s:startuptime = reltime()
  au vimRc VimEnter * let s:startuptime = reltime(s:startuptime) | redraw
        \ | echomsg 'startuptime: ' . reltimestr(s:startuptime)
endif

" unix {{{1
set shell=/bin/sh

if exists('$TMUX')
  let &t_ti.="\eP\e[1 q\e\\"
  let &t_SI.="\eP\e[5 q\e\\"
  let &t_SR.="\eP\e[3 q\e\\"
  let &t_EI.="\eP\e[1 q\e\\"
  let &t_te.="\eP\e[0 q\e\\"
else
  let &t_ti.="\<Esc>[1 q"
  let &t_SI.="\<Esc>[5 q"
  let &t_SR.="\<Esc>[3 q"
  let &t_EI.="\<Esc>[1 q"
  let &t_te.="\<Esc>[0 q"
endif

if has('termguicolors')
  if &term =~# 'tmux-256color'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

if !has('nvim')
  if &term =~# 'tmux-256color'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
  endif
endif

" bracketed paste mode work inside tmux:
if $TERM =~# '^\%(tmux\|screen\)'
  set ttymouse=xterm2
  let &t_BE = "\033[?2004h"
  let &t_BD = "\033[?2004l"
  let &t_PS = "\033[200~"
  let &t_PE = "\033[201~"
endif

" environment. {{{1
let $CACHE       = expand('$HOME/.cache/')
let $CACHE_HOME  = expand('$CACHE/vim')
let $VIM_PATH    = expand('~/.vim')
let $MYVIMRC     = expand('~/.vim/vimrc')
let $BACKUP_PATH = expand('$CACHE/vim/back')

let s:undo_dir   = $CACHE_HOME . '/undo'
let s:backup_dir = $CACHE_HOME . '/back'
let s:directory  = $CACHE_HOME . '/dir'
let s:view_dir   = $CACHE_HOME . '/view'
call functions#mkdir(s:undo_dir)
call functions#mkdir(s:backup_dir)
call functions#mkdir(s:directory)
call functions#mkdir(s:view_dir)

" disable some vim plugins. {{{1
let g:loaded_matchparen         = 1
let g:loaded_rrhelper           = 1
let g:did_install_default_menus = 1
let g:is_bash                   = 1
let g:sh_noisk                  = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_logipat            = 1
let g:loaded_man                = 1

" large file {{{1
let g:LargeFile = 20*1024*1024 " 20MB

" options. {{{1
"""" terminal vim
set notimeout
set ttimeout
set ttimeoutlen=10
set lazyredraw

"""" viminfo
set viminfo=!,'300,<50,s10,h,n$CACHE_HOME/.viminfo

"""" path
set path=.,**

"""" backup, swap, undo
set undofile
set nobackup
set swapfile
exe 'set undodir=' . s:undo_dir
exe 'set backupdir=' . s:backup_dir
exe 'set directory=' . s:directory
exe 'set viewdir=' . s:view_dir
set viewoptions=cursor,folds,slash,unix

"""" moving around/editing
set nostartofline
set nowrap
set virtualedit=block
set sidescrolloff=10
set sidescroll=1
let &showbreak = '↳ '
set breakat=\ \ ;:,!?
set breakindent
set breakindentopt=sbr
set backspace=indent,eol,start
set noshowmatch
set matchtime=1
set matchpairs&
set nrformats-=octal
set display=lastline

"""" searching and patterns
set incsearch
set hlsearch|nohlsearch
autocmd vimRc InsertLeave * :setlocal hlsearch
autocmd vimRc InsertEnter * :setlocal nohlsearch
set gdefault

"""" windows, buffers
set switchbuf=useopen,usetab
set splitright
set splitbelow

"""" sessions
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=help
set sessionoptions-=curdir
set sessionoptions+=globals
set sessionoptions+=unix

"""" Insert completion
set dictionary='$HOME/.vim/dict'
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt+=preview
set completeopt+=menuone,noselect
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

"""" text formatting
set formatoptions=q
set formatoptions+=j
set formatoptions+=n
set formatoptions+=1

""""" diff
set diffopt+=context:3,indent-heuristic,algorithm:patience

"""" display
set number
set mouse=a
set ttymouse=sgr
set tabline=%!functions#tabline()
set t_ut=
set cursorline
set list
let &g:listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:⦸'
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•
set termguicolors

"""" messages, info, status
set visualbell t_vb=
set confirm
set showcmd
set noshowmode
set shortmess+=Icm
set laststatus=2

"""" tabs/indent levels
set autoindent
set copyindent
set preserveindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

"""" reading/writing
set autoread

"""" spell
set helplang=en
set nospell
set spelllang=en_us
set fileformats=unix,dos,mac

"""" command line
set history=1000
set wildmenu
set wildmode=longest:full,full
set wildoptions=tagfile
set wildignore+=**/node_modules/**
set wildignore+=**/bower_components/**
set wildcharm=<C-Z>

"""" update time
set updatetime=500

" mapping. {{{1
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <c-s> :<c-u>update<cr>
inoremap <c-s> <esc>:update<cr>
xnoremap <c-s> <esc>:<c-u>update<cr>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
inoremap <c-a> <Home>
inoremap <c-e> <End>

" windows
nnoremap <silent> <Tab> :wincmd w<CR>

" completion: enter select and close popup
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"

" prev and next buffer
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" lists
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>

" niceblock
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')

" innerline
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>

" entire
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>

" file size
nnoremap <F3> :echo functions#getfilesize()<cr>

" disable EX-mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" execute macro
nnoremap Q @q
" Run macro on selected lines
vnoremap Q :norm Q<cr>

" search and star search
nnoremap * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
nnoremap c* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>cgn
nnoremap d* :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>cgn
vnoremap n :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>
vnoremap <s-n> :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>
vnoremap * :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>

" cmdwinenter
nnoremap <leader><leader> q:

" git commands
nnoremap <silent> <expr> <leader>dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"

" grep
nnoremap gr :<C-u>Grep<Space>

" commands history
nnoremap <leader>] :CmdHist<cr>

" smart space mapping
nmap <Space> [Space]
nnoremap  [Space] <Nop>
vmap <Space> [Space]
vnoremap  [Space] <Nop>

" yank from cursor position to end of line
nnoremap Y y$

" yank to clipboard
vnoremap [Space]y "+y

" paste from clipboard
nnoremap [Space]p :put+<cr>
vnoremap [Space]p "+p
nnoremap [Space]P :put!+<cr>
vnoremap [Space]P "+P

" Paste continuously.
nnoremap [p "0p
nnoremap ]p viw"0p
vnoremap [p "0p
vnoremap . "0p


" replace a word with clipboard
nnoremap [Space]w viw"+p

" switch buffers
nnoremap [Space]1 1<c-w>w
nnoremap [Space]2 2<c-w>w
nnoremap [Space]3 3<c-w>w
nnoremap [Space]4 4<c-w>w
nnoremap [Space]5 5<c-w>w
nnoremap [Space]6 6<c-w>w
nnoremap [Space]7 7<c-w>w
nnoremap [Space]8 8<c-w>w
nnoremap [Space]9 9<c-w>w

" zoom
nnoremap <C-w>t :tabedit %<cr>
nnoremap <C-w>z :tabclose<cr>
nnoremap <silent> <S-tab> :tabnext<CR>

" completion
inoremap <expr> <tab> functions#inserttabwrapper()
inoremap <s-tab> <c-p>

" sessions
nnoremap [Space]s :call sessions#load()<cr>

" use packager: yukimemi. {{{1
set packpath^=$CACHE_HOME
let s:packager_dir = $CACHE_HOME . '/pack/packager/opt/vim-packager'
let s:packager_download = 0
if has('vim_starting')
  if !isdirectory(s:packager_dir)
    echo 'Install vim-packager ...'
    execute '!git clone --depth 1 https://github.com/kristijanhusak/vim-packager ' . s:packager_dir
    let s:packager_download = 1
  endif
endif

" packager init. {{{1
let s:packager_init = 0
let s:plugins = []
function! PackagerInit() abort
  packadd vim-packager

  for plugin in s:plugins
    call packager#add(plugin[0], plugin[1])
  endfor
endfunction

" packager helper function. {{{1
let s:lazy_plugs = []
function! s:packager_add(repo, ...) abort
  let l:opts = get(a:000, 0, {})
  if has_key(l:opts, 'if')
    if ! l:opts.if
      return
    endif
  endif

  let l:name = substitute(a:repo, '^.*/', '', '')

  " packadd on filetype.
  if has_key(l:opts, 'ft')
    let l:ft = type(l:opts.ft) == type([]) ? join(l:opts.ft, ',') : l:opts.ft
    exe printf('au vimRc FileType %s packadd %s', l:ft, l:name)
  endif

  " packadd on cmd.
  if has_key(l:opts, 'cmd')
    let l:cmd = type(l:opts.cmd) == type([]) ? join(l:opts.cmd, ',') : l:opts.cmd
    exe printf('au vimRc CmdUndefined %s packadd %s', l:cmd, l:name)
  endif

  " lazy load.
  if has_key(l:opts, 'lazy')
    if l:opts.lazy
      call add(s:lazy_plugs, l:name)
    endif
  endif

  call add(s:plugins, [a:repo, l:opts])
endfunction

com! -nargs=+ Pac call <SID>packager_add(<args>)

" load lazy plugins. {{{1
let s:idx = 0
function! PackAddHandler(timer)
  exe 'packadd ' . s:lazy_plugs[s:idx]
  let s:idx += 1
  " doautocmd BufReadPost
  au! lazy_load_bundle
endfunction

aug lazy_load_bundle
  au vimRc VimEnter * call timer_start(0, 'PackAddHandler', {'repeat': len(s:lazy_plugs)})
aug END

" start. {{{1
Pac 'zhimsel/vim-stay'
Pac 'LnL7/vim-nix'

" opt. {{{1
Pac 'kristijanhusak/vim-packager', { 'type': 'opt' }
Pac 'tpope/vim-fugitive', { 'type': 'opt' }
Pac 'mhinz/vim-signify', { 'type': 'opt' }
Pac 'dense-analysis/ale', { 'type': 'opt', 'lazy': 1 }
Pac 'gregsexton/gitv', { 'type': 'opt' }
Pac 'hotwatermorning/auto-git-diff', { 'type': 'opt' }
Pac 'Tiancheng-Luo/conflict3', { 'type': 'opt' }
Pac 'tpope/vim-vinegar', { 'type': 'opt', 'lazy': 1 }
Pac 'junegunn/fzf.vim', { 'type': 'opt', 'cmd': ['Files', 'Buffers'] }
Pac 'itchyny/lightline.vim', { 'type': 'opt', 'lazy': 1 }
Pac 'sgur/vim-editorconfig', { 'type': 'opt', 'lazy': 1 }
Pac 'tpope/vim-repeat', { 'type': 'opt', 'lazy': 1 }
Pac 'tpope/vim-surround', { 'type': 'opt', 'lazy': 1 }
Pac 'tpope/vim-dispatch', { 'type': 'opt', 'lazy': 1 }
Pac 'tomtom/tcomment_vim', { 'type': 'opt', 'lazy': 1 }
Pac 'markonm/traces.vim', { 'type': 'opt', 'lazy': 1 }
Pac 'sgur/cmdline-completion', { 'type': 'opt' }
Pac 'markonm/hlyank.vim', { 'type': 'opt', 'lazy': 1 }
Pac 'qxxxb/vim-searchhi', { 'type': 'opt', 'lazy': 1 }
Pac 'osyo-manga/vim-anzu', { 'type': 'opt', 'lazy': 1 }
Pac 'thinca/vim-localrc', { 'type': 'opt', 'lazy': 1 }
Pac 'mbbill/undotree', { 'type': 'opt', 'cmd': 'UndotreeToggle' }
Pac 'junegunn/vim-easy-align', { 'type': 'opt', 'lazy': 1 }
Pac 'itchyny/vim-parenmatch', { 'type': 'opt', 'lazy': 1 }
Pac 'wellle/targets.vim', { 'type': 'opt', 'lazy': 1 }
Pac 'delphinus/vim-auto-cursorline', { 'type': 'opt', 'lazy': 1 }
Pac 'gcmt/wildfire.vim', { 'type': 'opt', 'lazy': 1 }
Pac 'gabesoft/vim-ags', { 'type': 'opt', 'cmd': 'Ags' }
Pac 'Kazark/vim-SimpleSmoothScroll', { 'type': 'opt', 'lazy': 1 }
Pac 'stefandtw/quickfix-reflector.vim', { 'type': 'opt', 'lazy': 1 }
Pac 'haya14busa/vim-edgemotion', { 'type': 'opt', 'lazy': 1 }
Pac 'chrisbra/Recover.vim', { 'type': 'opt', 'lazy': 1 }
Pac 'kana/vim-submode', {'type': 'opt'}
Pac 'itchyny/vim-pdf', {'type': 'opt', 'ft': 'pdf'}
Pac 'lumiliet/vim-twig', {'type': 'opt', 'ft': 'twig'}
Pac 'alvan/vim-closetag', {'type': 'opt', 'lazy': 1}
Pac 'lepture/vim-jinja', {'type': 'opt', 'ft': 'jinja2'}
Pac 'jelera/vim-javascript-syntax', {'type': 'opt', 'ft': ['javascript', 'javascript.jsx']}
Pac 'MaxMEllon/vim-jsx-pretty', {'type': 'opt', 'ft': ['javascript', 'javascript.jsx']}
Pac 'jonsmithers/vim-html-template-literals', {'type': 'opt', 'ft': ['javascript', 'javascript.jsx']}
Pac 'HerringtonDarkholme/yats.vim', {'type': 'opt', 'ft': ['typescript', 'typescript.tsx']}
Pac 'plasticboy/vim-markdown', {'type': 'opt', 'ft': 'markdown'}
Pac 'kchmck/vim-coffee-script', {'type': 'opt', 'ft': 'coffee'}
Pac 'elzr/vim-json', {'type': 'opt', 'ft': 'json'}
Pac 'stephpy/vim-yaml', {'type': 'opt', 'ft': ['yml', 'yaml']}

" plugins commands. {{{1
com! PackagerInstall call PackagerInit() | call packager#install()
com! PackagerUpdate call PackagerInit() | call packager#update()
com! PackagerClean call PackagerInit() | call packager#clean()
com! PackagerStatus call PackagerInit() | call packager#status()

" Install on initiall setup.
if s:packager_download
  PackagerInstall
endif

" ale. {{{1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_set_highlights = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_maximum_file_size = 1024 * 1024
let g:ale_completion_enabled = 1
let g:ale_set_balloons = 1
let g:ale_sign_warning = '_w'
let g:ale_sign_error = '_e'
let g:ale_sign_info = 'ℹ'
let g:ale_echo_msg_error_str='(e)'
let g:ale_echo_msg_info_str='(i)'
let g:ale_echo_msg_warning_str='(w)'
let g:ale_echo_msg_format = '%linter%: %s %severity%'
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
      \   '\.min\.(js\|css)$': {
      \       'ale_linters': [],
      \       'ale_fixers': []
      \   },
      \   'jquery.*': {
      \       'ale_linters': [],
      \       'ale_fixers': []
      \   },
      \   'node_modules/.*': {
      \       'ale_linters': [],
      \       'ale_fixers': []
      \   },
      \   'package.json': {
      \       'ale_fixers': []
      \   },
      \}
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)

" vinegar. {{{1
let g:netrw_bufsettings         = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile             = 1
let g:netrw_dirhistmax          = 0
autocmd vimRc FileType netrw call functions#innetrw()

" fzf. {{{1
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>
call fz_f#fzf()

" lightline. {{{1
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['gitbranch', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo'],
      \              [ 'filetype' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['filename'] ],
      \   'right': [ [ ], [ ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a2":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"\uff0b":&modifiable?"":"-"}',
      \   'filename': '%{LightLineFilename()}',
      \   'gitbranch': '%{exists("*fugitive#head")?fugitive#head():""}',
      \   'lineinfo': '%3c:%-2l/%L'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'lineinfo': 'percentage'
      \ },
      \ 'separator': { 'left': "\ue0b8", 'right': "\ue0be" },
      \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0b9" }
      \ }

function! LightLineFilename()
  return ('' !=# expand('%') ? expand('%') : '[No Name]')
endfunction

" editorconfig. {{{1
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

" surround. {{{1
let surround_indent=1
nmap S ysiw

" traces. {{{1
nnoremap ss :%s/
nnoremap sl :s/
nnoremap sr :s/\<<C-r><C-w>\>/
vnoremap s  :'<,'>s/
nnoremap sa :%s/\<<c-r><c-w>\>/<c-r><c-w>
nnoremap sp vip :s/
nnoremap sw :%s/\<<c-r><c-w>\>/

" cmdline-completion. {{{1
autocmd vimRc CmdlineEnter * packadd cmdline-completion

" undotree. {{{1
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
nnoremap <leader>u :UndotreeToggle<cr>

" easy-align. {{{1
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" searchhi. {{{1
let g:searchhi_user_autocmds_enabled = 1
let g:searchhi_redraw_before_on = 1
let g:searchhi_clear_all_autocmds = 'InsertEnter'
let g:searchhi_update_all_autocmds = 'InsertLeave'

augroup searchhi
  autocmd!
  autocmd User SearchHiOn AnzuUpdateSearchStatusOutput
  autocmd User SearchHiOff echo g:anzu_no_match_word
augroup END

nmap / <Plug>(searchhi-/)
nmap ? <Plug>(searchhi-?)

vmap / <Plug>(searchhi-v-/)
vmap ? <Plug>(searchhi-v-?)

nmap n zz<Plug>(searchhi-n)
nmap N zz<Plug>(searchhi-N)

vmap n zz<Plug>(searchhi-v-n)
vmap N zz<Plug>(searchhi-v-N)

nmap <silent> [Space]n <Plug>(searchhi-clear-all)
vmap <silent> [Space]n <Plug>(searchhi-v-clear-all)

" git. {{{1
nnoremap [fugitive]  <Nop>
nmap <space>g [fugitive]
nnoremap <silent> [fugitive]s :<C-u>Gstatus<CR>
nnoremap <silent> [fugitive]c :<C-u>Gcommit<CR>
nnoremap <silent> [fugitive]C :<C-u>Gcommit --amend<CR>
nnoremap <silent> [fugitive]a :<C-u>Dispatch! git add %<CR>
nnoremap <silent> [fugitive]r :<C-u>Dispatch! git reset %<CR>
nnoremap <silent> [fugitive]D :<C-u>Dispatch! git checkout -- %<CR>
nnoremap <silent> [fugitive]p :<C-u>Dispatch! git push<CR>
nnoremap <silent> [fugitive]P :<C-u>Dispatch! git push -f<CR>
nnoremap <silent> [fugitive]d :<C-u>Gvdiffsplit<CR>
nnoremap <silent> [fugitive]l :<C-u>Gitv --all<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zf :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd vimRc FileType fugitive call InFugitive()

nnoremap [Space]v :SignifyDiffPreview<cr>

function! s:enable_git_plugins() abort
  if system('git rev-parse --is-inside-work-tree') =~# '\m\C^true'
    packadd vim-fugitive
    packadd vim-signify
    packadd gitv
    packadd auto-git-diff
    packadd conflict3
    autocmd vimRc FocusGained,FocusLost,CursorHold * SignifyRefresh | SignifyEnable
  endif
endfunction
autocmd! vimRc BufReadPre * call s:enable_git_plugins()

" wildfire. {{{1
let g:wildfire_objects = [ 'iw', 'il', "i'", "a'", 'i"', 'i)', 'a)', 'i]', 'a]', 'i}', 'a}', 'i<', 'a<', 'ip', 'it']
let g:wildfire_fuel_map = '+'
let g:wildfire_water_map = '-'
nmap <leader>s <Plug>(wildfire-quick-select)

" submode. {{{1
function! SubMode()
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
endfunction
autocmd vimRc BufReadPre * packadd vim-submode | call SubMode()

" ags. {{{1
let g:ags_winplace = 'right'

" edge motion {{{1
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" closetag. {{{1
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.twig,*.html.twig'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js,*.twig,*.html.twig'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript,twig,html.twig'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,javascript,twig,html.twig'

" file types. {{{1
augroup vimrc_filetype
  autocmd!
  autocmd BufWritePost * nested
        \ if &l:filetype ==# '' || exists('b:ftdetect')
        \ |   unlet! b:ftdetect
        \ |   filetype detect
        \ | endif
augroup END

" commands. {{{1
command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command! Bd setlocal bufhidden=delete | bnext
command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! -nargs=0 HL call functions#hl()
command! -nargs=* -complete=file Grep call grep#dgrep('grep<bang>',<q-args>)
command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
command! -nargs=0 SS call sessions#load()
command! -range GB echo join(systemlist("git blame -L <line1>,<line2> " . expand('%')), "\n")
command! CmdHist call fzf#vim#command_history({'right': '40'})
command! OpenChangedFiles :call functions#changedfiles()
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
      \ | diffthis | wincmd p | diffthis

" autocmds. {{{1
"""" mouse fix in multiple splits
autocmd vimRc BufRead,BufNewFile * setlocal ttymouse=sgr

"""" If a file is large, disable syntax highlighting, filetype etc
autocmd vimRc BufReadPre *
      \ let s = getfsize(expand("<afile>")) |
      \ if s > g:LargeFile || s == -2 |
      \   call functions#large_file(fnamemodify(expand("<afile>"), ":p")) |
      \ endif

"""" don't list location-list / quickfix windows
autocmd vimRc BufReadPost quickfix setlocal nobuflisted
autocmd vimRc BufReadPost quickfix nnoremap <buffer> gq :bd<CR>
autocmd vimRc FileType help nnoremap <buffer> gq :bd<CR>
autocmd vimRc CmdwinEnter * nnoremap <silent><buffer> gq :<C-u>quit<CR>

"""" qf and help keep widow full width
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end

"""" completion
autocmd vimRc FileType * execute 'setlocal dictionary+='.expand($HOME.'/.vim/dict/'.&filetype.'.dict')

"""" update diff
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif

"""" external changes
autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | endif

"""" mkdir
autocmd vimRc BufWritePre * call functions#mkdirifnotexist()

autocmd vimRc BufNewFile,BufRead * call matchadd('SpecialKey', '\s\+')
autocmd vimRc BufNewFile,BufRead * call matchadd('NonText', '\n\+')

"""" sessions
autocmd vimRc VimLeavePre * call sessions#make()

" diff. {{{1
call diff#diff()

" sytax enable. {{{1
call vimrc#on_filetype()

" colorscheme. {{{1
set background=dark
silent! colorscheme simple
highlight ParenMatch guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
highlight Comment    guifg=#5c6370 guibg=NONE    gui=italic cterm=italic

set secure
