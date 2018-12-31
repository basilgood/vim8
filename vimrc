"""" vimrc
set encoding=utf-8
scriptencoding utf-8

""" startup time
if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
          \                 | redraw
          \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

"""" arrow keyds
if (&term =~# '^tmux') || (&term =~# '^st')
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

"""" Moving Around/Editing
set nostartofline
set nowrap
set virtualedit=block
set scrolloff=3
set sidescrolloff=10
set sidescroll=1
set nostartofline
set diffopt=filler,vertical
let &showbreak = '↳ '
set breakindent
set breakindentopt=sbr
set backspace=2
set showmatch
set matchtime=2
set nrformats-=octal

"""" Searching and Patterns
set incsearch
set hlsearch

"""" Windows, Buffers
set hidden
set switchbuf=useopen,usetab
set splitright
set splitbelow

"""" Sessions
set sessionoptions-=options

"""" Shell
if &shell =~# 'fish$'
  set shell=/usr/bin/env\ bash
endif

"""" Delete comment character when joining commented lines
set formatoptions+=j

"""" Grep
set grepprg=grep\ -nH
" if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
"   set grepformat=%f:%l:%c:%m,%f:%l:%m
" endif

"""" Insert completion
set dictionary='$HOME/.vim/dict'
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=noselect
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

"""" Text Formatting
set formatoptions=q
set formatoptions+=n
set formatoptions+=1

"""" Display
set number
set mouse=a
set cursorline

if &encoding =~# '^u\(tf\|cs\)'
  set list
  let s:tab = nr2char(9655)
  let s:dot = nr2char(8901)
  let s:trail = nr2char(164)
  let s:nbsp = nr2char(244)
  exe 'set listchars=tab:'    . s:tab . '\ '
  exe 'set listchars+=trail:' . s:trail
  exe 'set listchars+=space:' . s:dot
  exe 'set listchars+=nbsp:'  . s:nbsp
endif

"""" Messages, Info, Status
set visualbell t_vb=
set confirm
set showcmd
set report=0
set shortmess+=aI
set ruler
set laststatus=2

set statusline=
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
set statusline+=\ %n
set statusline+=%#Visual#
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#
set statusline+=%R
set statusline+=%#Error#
set statusline+=%M
set statusline+=%#CursorIM#
set statusline+=\ %f
set statusline+=%=
set statusline+=%#CursorIM#
set statusline+=\ \%{StatuslineGit()}
set statusline+=\ %Y
set statusline+=%#CursorIM#
set statusline+=\ %-2c:%3l/%L

"""" Tabs/Indent Levels
set autoindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

"""" Reading/Writing
set autoread
set modeline
set modelines=5
set fileformats=unix,dos,mac

"""" Backups/Swap Files
function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    if exists('*mkdir')
      call mkdir(a:dir,'p')
      echo 'Created directory: ' . a:dir
    else
      echo 'Please create directory: ' . a:dir
    endif
  endif
endfunction

call EnsureDirExists($HOME . '/.vim/files/backup')
set backup
set backupdir=$HOME/.vim/files/backup/
set backupext=-vimbackup
set backupskip  =
call EnsureDirExists($HOME . '/.vim/files/swap')
set directory=$HOME/.vim/files/swap//
set updatecount =100
call EnsureDirExists($HOME . '/.vim/files/undo')
set undofile
set undodir=$HOME/.vim/files/undo/
call EnsureDirExists($HOME . '/.vim/files/info')
set viminfo='100,n$HOME/.vim/files/info/viminfo

"""" Command Line
set history=1000
set wildmenu
set wildmode=full
set wildcharm=<C-Z>

"""" Time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10
set ttyfast
set lazyredraw

"""" Update time
set updatetime=500

let g:is_bash = 1
let g:sh_noisk = 1

""" Mappings
nnoremap <Bs> :ls<CR>:b
nnoremap <Space>n :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
vnoremap . :normal .<CR>
nnoremap <silent> <M--> :vertical resize +1<CR>
nnoremap <silent> <M-=> :vertical resize -1<CR>
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
xnoremap <C-s> <C-C>:<C-u>update<CR>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-r>=icr#ICR()\<CR>"
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
nnoremap <Space>w viw"+p
nnoremap <Space>p :put+<CR>=`]<C-o>
nnoremap <Space>P :put+<CR>=`]<C-o>
vnoremap <Space>y "+y
vnoremap <Space>p "+p
vnoremap <Space>P "+P
nnoremap <leader>ss :%s/
nnoremap <leader>sa :s/
vnoremap <leader>ss :s/
nnoremap <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <leader>r :s/\<<C-r><C-w>\>/<C-r><C-w>
nnoremap <Space>z :tab split<CR>
nnoremap <Space>q :tabclose<CR>
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

"""" plugins
"""" netrw
let g:netrw_localrmdir='rm -r'

function! KeysInNetrw()
  nmap <buffer> <Right> <CR>
  nmap <buffer> <Left> -
  nmap <buffer> l qf
endfunction

augroup vimrcNetrw
  autocmd!
  autocmd FileType netrw call KeysInNetrw()
augroup End

"""" bracketed paste
let &t_ti .= "\<Esc>[?2004h"
let &t_te = "\e[?2004l" . &t_te

function! XTermPasteBegin(ret)
  set pastetoggle=<f29>
  set paste
  return a:ret
endfunction

execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>

"""" mkdir
augroup Mkdir
  autocmd!
  autocmd BufWritePre *
        \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
        \ endif
augroup END

"""" whitespace
command! -nargs=0 WS
      \ let _w=winsaveview() <Bar>
      \ let _s=@/ |
      \ %s/\s\+$//e |
      \ let @/=_s|
      \ unlet _s |
      \ call winrestview(_w) |
      \ unlet _w

"""" sessions
function! MakeSession()
  let b:sessiondir = $HOME . '/.vim/sessions' . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe 'mksession! ' . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . '/.vim/sessions' . getcwd()
  let b:sessionfile = b:sessiondir . '/session.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo 'No session loaded.'
  endif
endfunction

augroup Session
  autocmd!
  if(argc() == 0)
    autocmd VimEnter * nested :call LoadSession()
  endif
  autocmd VimLeave * :call MakeSession()
augroup End

"""" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#disable_auto_complete=1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion  =  1
let g:neocomplete#keyword_patterns          = {'_': '\h\w*'}
let g:neocomplete#sources#buffer#cache_limit_size  = 50000

let g:neocomplete#sources#dictionary#dictionaries  = {
      \    '_':          '',
      \    'css':        $HOME . '/.vim/dict/css.dict',
      \    'html':       $HOME . '/.vim/dict/html.dict',
      \    'javascript': $HOME . '/.vim/dict/javascript.dict',
      \    'vim':        $HOME . '/.vim/dict/vim.dict',
      \    'php':        $HOME . '/.vim/dict/php.dict'
      \}

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()

function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"""" mundo
let g:mundo_width = 30
let g:mundo_preview_height = 20
let g:mundo_right = 1
let g:mundo_preview_bottom = 1

"""" jsx
let g:jsx_ext_required = 0

"""" inline edit
let g:inline_edit_new_buffer_command = 'tabedit'

"""" editorconfig
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1
let g:editorconfig_blacklist = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

"""" cursorshape
if exists('$TMUX')
  let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
  let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
else
  let &t_SI .= "\e[6 q"
  let &t_SR .= "\e[4 q"
  let &t_EI .= "\e[2 q"
endif

"""" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
if executable('fd')
  let g:ctrlp_user_command = 'fd --type f --color never --hidden --exclude ".git" "" %s'
  let g:ctrlp_use_caching = 0
endif

"""" quickrun
let g:quickrun_config = {
      \'_': {
      \'runner': 'job',
      \'outputter' : 'error',
      \'outputter/error/success' : 'buffer',
      \'outputter/error/error'   : 'quickfix',
      \'outputter/quickfix/open_cmd' : 'copen',
      \'outputter/buffer/split' : ':botright 8sp',
      \'hook/quickfix_status_enable/enable_exit' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/enable' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/enable_exit' : 1,
      \'hook/quickfix_replace_tempname_to_bufnr/priority_exit' : -10,
      \},
      \}

"""" git modified files
function! OpenChangedFiles()
  only
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec 'edit ' . filenames[0]
  for filename in filenames[1:]
    exec 'sp ' . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

"""" asterisk
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

let g:asterisk#keeppos = 1

"""" ale
let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0
let g:ale_sign_info = 'i'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '⬥ '
let g:ale_sign_warning = '⬥ '
highlight ALEWarningSign guibg=#282c34 guifg=DarkYellow
highlight ALEErrorSign guibg=#282c34 guifg=DarkMagenta

let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'html': ['eslint']
      \}

let g:ale_linter_aliases = {
      \ 'html': 'javascript'
      \}

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'yaml': ['yamllint'],
      \ 'vim': ['vint'],
      \ 'nix': ['nix'],
      \ 'html': ['elsint']
      \}
nmap <silent> <leader>j <Plug>(ale_previous_wrap)
nmap <silent> <leader>k <Plug>(ale_next_wrap)

"""" agrep
augroup aGrep
  autocmd!
  if !exists('s:agrep_cmd')
    autocmd BufWinEnter Agrep setlocal nornu | setlocal nowrap
    let s:agrep_cmd = 1
  endif
augroup END

let g:agrep_default_flags = '-I --exclude-dir=.{git,svn,tags} --exclude={tags,yarn.lock}'
map <Leader>] :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cn' : 'Anext')<CR>
map <Leader>[ :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cp' : 'Aprev')<CR>
map ]n :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cn' : 'Anfile')<CR>
map [n :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cp' : 'Apfile')<CR>

"""" ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ack_use_dispatch=1
let g:ackhighlight = 1
let g:ack_mappings = { 'o': '<CR>zz' }

filetype plugin indent on

""" Autocommands
augroup fileType
  autocmd!
  autocmd BufNewFile,BufRead *.vim set filetype=vim
  autocmd BufNewFile,BufRead *.txt set filetype=journal
  autocmd BufNewFile,BufRead *.twig set filetype=html.twig
  autocmd BufNewFile,BufRead *.nix set filetype=nix
  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.ldg,*.ledger set filetype=ledger
  autocmd BufNewFile,BufRead *.j2 set filetype=jinja
  autocmd BufNewFile,BufRead *.js set filetype=javascript
  autocmd BufNewFile,BufRead *.html set filetype=html
  autocmd BufNewFile,BufRead *.fish setlocal filetype=fish
  autocmd BufNewFile,BufRead *.config setlocal filetype=journal
  autocmd BufNewFile,BufRead *.conf setlocal filetype=journal
  autocmd BufNewFile,BufRead *.coffee set filetype=coffee
augroup END

augroup quickFix
  autocmd!
  autocmd FileType qf call AdjustWindowHeight(2, 8)
augroup End
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line('$'), a:maxheight]), a:minheight]) . 'wincmd _'
endfunction

augroup vimrcEx
  autocmd!
  " Quicfix on entire tab
  autocmd FileType qf wincmd J
  autocmd FileType qf nnoremap <silent><buffer> <Esc> :q<CR>

  " Quit help
  autocmd FileType help nnoremap <silent><buffer> <Esc> :q<CR>

  " syntax highlight
  autocmd BufEnter * syntax sync fromstart

  " Load opt plugins
  autocmd BufEnter * call timer_start(300, function('pack_opt#plugins'))

  " Try to jump to the last spot the cursor was at in a file when reading it.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   silent! exe 'normal! g`"zzza' |
        \ endif

  autocmd Syntax javascript setlocal isk+=$
  autocmd FileType javascript setlocal dictionary+=$HOME/.vim/dict/javascript.dict
  autocmd FileType vim setlocal dictionary+=$HOME/.vim/dict/vim.dict

  autocmd FileType html setlocal iskeyword+=~ | let b:dispatch = ':OpenURL %'

augroup END

syntax enable

"""" Colorscheme
if has('termguicolors')
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark
silent! colorscheme kolor
highlight Comment cterm=italic gui=italic
highlight Search guibg=#1a561d guifg=#c9d7e0
highlight IncSearch guibg=#edb825 guifg=#1a561d
highlight SpecialKey guifg=#5c6370
highlight Visual guifg=NONE guibg=#010101
" highlight NonText guifg=#5c6370 guibg=NONE
highlight LineNr guifg=#5c6370
highlight Include ctermfg=81 guifg=#9A93E1 cterm=italic gui=italic
highlight Keyword cterm=italic gui=italic
highlight Type cterm=italic gui=italic
highlight jsThis cterm=italic gui=italic
highlight jsFunction cterm=italic gui=italic
highlight jsModuleAsterisk cterm=italic gui=italic
highlight jsStorageClass cterm=italic gui=italic
highlight jsExportDefault cterm=italic gui=italic
highlight jsObjectKey cterm=italic gui=italic
highlight jsObjectFuncName cterm=italic gui=italic ctermfg=14 guifg=#83AFE5
highlight jsClassFuncName cterm=italic gui=italic ctermfg=14 guifg=#83AFE5
