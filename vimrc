"""" vimrc
set encoding=utf-8
scriptencoding utf-8

"""" startup time
if !v:vim_did_enter && has('reltime')
  let g:startuptime = reltime()
  augroup vimrc-startuptime
    autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
          \                 | redraw
          \                 | echomsg 'startuptime: ' . reltimestr(g:startuptime)
  augroup END
endif

"""" general group
augroup MyAutoCmd
  autocmd!
augroup END

"""" termguicolors
if !has('gui_running')
      \ && exists('&termguicolors')
  if !has('nvim')
    let &t_8f = "\e[38;2;%lu;%lu;%lum"
    let &t_8b = "\e[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif

"""" environment
let $CACHE = expand('$HOME/.cache/vimcache')

function! s:EnsureDirExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), 'p')
  endif
endfunction

"""" arrow keys
if (&term =~# '^tmux') || (&term =~# '^st-256color') || (&term =~# '^alacritty-256color')
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

"""" Alt-arrows move between windows
nnoremap <silent> [1;3A <C-w><Up>
nnoremap <silent> [1;3B <C-w><Down>
nnoremap <silent> [1;3C <C-w><Right>
nnoremap <silent> [1;3D <C-w><Left>

"""" Alt-hjkl resize windows
nnoremap <silent> l :vertical resize +5<cr>
nnoremap <silent> h :vertical resize -5<cr>
nnoremap <silent> j :resize +5<cr>
nnoremap <silent> k :resize -5<cr>

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

"""" viminfo
set viminfo=!,'100,h,n$CACHE/viminfo

"""" backup
set nobackup
set nowritebackup

"""" swap and undo
set noswapfile
set history=1000
set undofile
set undodir=$CACHE/undo//
silent! call s:EnsureDirExists(&undodir)

"""" moving around/editing
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

"""" searching and patterns
set incsearch
set hlsearch|nohlsearch
set gdefault

"""" windows, buffers
set hidden
set switchbuf=useopen,usetab
set splitright
set splitbelow

"""" sessions
set sessionoptions-=options

"""" shell
if &shell =~# 'fish$'
  set shell=/usr/bin/env\ bash
endif

"""" grep
set grepprg=grep\ -nH

"""" Insert completion
set dictionary='$HOME/.vim/dict'
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=noselect
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

"""" text formatting
set formatoptions=q
set formatoptions+=j
set formatoptions+=n
set formatoptions+=1

"""" display
set number
set mouse=a
set cursorline

"""" list
set list
let &listchars = 'tab:▸ ,space:·,extends:❯,precedes:❮,nbsp:ø'
let &fillchars = 'vert: ,diff: '  " ▚
autocmd MyAutoCmd InsertEnter * set listchars-=trail:⣿
autocmd MyAutoCmd InsertLeave * set listchars+=trail:⣿

"""" messages, info, status
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
set statusline+=\ \%#Visual#
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#
set statusline+=%R
set statusline+=%#IsModified#
set statusline+=%{&mod?expand('%:t'):''}%*
set statusline+=%{&mod?'':expand('%:t')}%*
set statusline+=%=
set statusline+=%#CursorIM#
set statusline+=%*\ \%{StatuslineGit()}%*
set statusline+=%y
set statusline+=%#CursorIM#
set statusline+=\ %-2c:%3l/%L
set statusline+=\ %*

"""" tabs/indent levels
set autoindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

"""" reading/writing
set autoread
set modeline
set modelines=5
set fileformats=unix,dos,mac

"""" command line
set wildmenu
set wildmode=full
set wildcharm=<C-Z>

"""" update time
set updatetime=500

"""" time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10
set ttyfast
set lazyredraw

let g:is_bash = 1
let g:sh_noisk = 1

""" mappings
" nnoremap <Bs> :ls<CR>:b
nnoremap <Space>n :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
vnoremap . :normal .<CR>
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
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
" paste from clipboard to a word
nnoremap <Space>w viw"+p
" paste from clipboard
nnoremap <Space>p :put+<CR>
vnoremap <Space>p "+p
nnoremap <Space>P :put!+<CR>
vnoremap <Space>P "+P
" yank to clipboard
vnoremap <Space>y "+y
" global substitution
nnoremap gs :%s/
vnoremap gs :s/
nnoremap gl :s/
" substitute word under the cursor
nnoremap gw :%s/\<<c-r><c-w>\>/
" append text
nnoremap ga :%s/\<<C-r><C-w>\>/<C-r><C-w>
" zoom buffer
nnoremap <Space>z :tab split<CR>
nnoremap <Space>q :tabclose<CR>
" yank from cursor position to end of line
nnoremap Y y$
" prev and next buffer
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
" lists
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>

" add a blank line above/below
nnoremap ]<space> m`o<Esc>``
nnoremap [<space> m`O<Esc>``

"""" search with vimgrep in buffer
nnoremap <leader>l :vimgrep! //j %<BAR>cw<s-left><s-left><right>

" auto escape in command-line mode
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

"""" plugins
"""" netrw
let g:netrw_localrmdir='rm -r'

function! KeysInNetrw()
  nmap <buffer> <Right> <CR>
  nmap <buffer> <Left> -
  nmap <buffer> l qf
endfunction

autocmd MyAutoCmd FileType netrw call KeysInNetrw()
autocmd MyAutoCmd FileType netrw nmap <buffer> <space>q :bdelete<CR>

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
autocmd MyAutoCmd BufWritePre *
      \ if !isdirectory(expand("<afile>:p:h")) |
      \ call mkdir(expand("<afile>:p:h"), "p") |
      \ endif

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
  let b:sessiondir = $CACHE . '/sessions' . getcwd()
  if (filewritable(b:sessiondir) != 2)
    call mkdir(b:sessiondir,'p')
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe 'mksession! ' . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $CACHE . '/sessions' . getcwd()
  let b:sessionfile = b:sessiondir . '/session.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo 'No session loaded.'
  endif
endfunction
command! -nargs=0 SL call LoadSession()

autocmd MyAutoCmd VimLeave * :call MakeSession()

"""" mundo
let g:mundo_width = 30
let g:mundo_preview_height = 20
let g:mundo_right = 1
let g:mundo_preview_bottom = 1

"""" alingta
vnoremap i: :Alignta =><Space>
vnoremap <silent> i= :Alignta => =/1<CR>

"""" jsx
let g:jsx_ext_required = 0

"""" highlightedyank
let g:highlightedyank_highlight_duration = 200

"""" comfortable motion
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

"""" inline edit
let g:inline_edit_new_buffer_command = 'tabedit'

"""" editorconfig
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1
let g:editorconfig_blacklist = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

"""" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
if executable('fd')
  let g:ctrlp_user_command = 'fd -t f -H -E "{*.git}" --color never "" %s'
  let g:ctrlp_use_caching = 0
endif

nnoremap <BS> :CtrlPBuffer<cr>
nnoremap <leader>s :CtrlPTmux<cr>

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

"""" tagbar
nnoremap <leader>t :TagbarOpenAutoClose<cr>

"""" cool
let g:CoolTotalMatches = 1

"""" git modified files
function! ModifiedFiles()
  only
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec 'edit ' . filenames[0]
  for filename in filenames[1:]
    exec 'sp ' . filename
  endfor
endfunction
command! MF :call ModifiedFiles()

"""" editorconfig
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1
let g:editorconfig_blacklist = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

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
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

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
if !exists('s:agrep_cmd')
  autocmd MyAutoCmd BufWinEnter Agrep setlocal nornu | setlocal nowrap
  let s:agrep_cmd = 1
endif

let g:agrep_default_flags = '-I --exclude-dir=.{git,svn,tags} --exclude={tags,yarn.lock}'
map <Leader>] :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cn' : 'Anext')<CR>
map <Leader>[ :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cp' : 'Aprev')<CR>
map ]n :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cn' : 'Anfile')<CR>
map [n :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cp' : 'Apfile')<CR>

"""" ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:ackhighlight = 1
let g:ack_mappings = { 'o': '<CR>zz' }

"""" show motion
nmap w <Plug>(show-motion-w)
nmap W <Plug>(show-motion-W)
nmap b <Plug>(show-motion-b)
nmap B <Plug>(show-motion-B)
nmap e <Plug>(show-motion-e)
nmap E <Plug>(show-motion-E)
nmap f <Plug>(show-motion-f)
nmap t <Plug>(show-motion-t)
nmap F <Plug>(show-motion-F)
nmap T <Plug>(show-motion-T)
nmap ; <Plug>(show-motion-;)
nmap , <Plug>(show-motion-,)

" yank with keeping cursor position in visual mode
function! s:keepcursor_visual_wrapper(command)
  exec 'normal! gv' . a:command
  exec "normal! gv\<ESC>"
endfunction
xnoremap <silent> y :<C-u>call <SID>keepcursor_visual_wrapper('y')<CR>
xnoremap <silent> Y :<C-u>call <SID>keepcursor_visual_wrapper('Y')<CR>

"""" asterisk
let g:asterisk#keeppos = 1
map *  <Plug>(asterisk-z*)zz
map #  <Plug>(asterisk-z#)zz
map g* <Plug>(asterisk-gz*)zz
map g# <Plug>(asterisk-gz#)zz
nnoremap n nzz
nnoremap N Nzz

"""" filetype
autocmd MyAutoCmd BufNewFile,BufRead *.vim set filetype=vim
autocmd MyAutoCmd BufNewFile,BufRead *.txt set filetype=journal
autocmd MyAutoCmd BufNewFile,BufRead *.twig set filetype=html.twig
autocmd MyAutoCmd BufNewFile,BufRead *.nix set filetype=nix
autocmd MyAutoCmd BufNewFile,BufRead *.md set filetype=markdown
autocmd MyAutoCmd BufNewFile,BufRead *.ldg,*.ledger set filetype=ledger
autocmd MyAutoCmd BufNewFile,BufRead *.j2 set filetype=jinja
autocmd MyAutoCmd BufNewFile,BufRead *.js set filetype=javascript
autocmd MyAutoCmd BufNewFile,BufRead *.html set filetype=html
autocmd MyAutoCmd BufNewFile,BufRead *.fish setlocal filetype=fish
autocmd MyAutoCmd BufNewFile,BufRead *.config setlocal filetype=journal
autocmd MyAutoCmd BufNewFile,BufRead *.conf setlocal filetype=journal
autocmd MyAutoCmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd MyAutoCmd BufNewFile,BufRead *.yamllint set filetype=yaml

" quicfix on entire tab
autocmd MyAutoCmd FileType qf wincmd J
autocmd MyAutoCmd FileType qf nnoremap <silent><buffer> <space>q :q<CR>

" quit help
autocmd MyAutoCmd FileType help nnoremap <silent><buffer> <space>q :q<CR>

autocmd MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd MyAutoCmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd MyAutoCmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd MyAutoCmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" load opt plugins
autocmd MyAutoCmd BufEnter * call timer_start(300, function('pack_opt#plugins'))

" jump to the last spot the cursor was at in a file when reading it.
autocmd MyAutoCmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   silent! exe 'normal! g`"zzza' |
      \ endif

autocmd MyAutoCmd Syntax javascript setlocal isk+=$
autocmd MyAutoCmd FileType javascript setlocal dictionary+=$HOME/.vim/dict/javascript.dict
autocmd MyAutoCmd FileType vim setlocal dictionary+=$HOME/.vim/dict/vim.dict

syntax enable
filetype plugin indent on

autocmd MyAutoCmd BufEnter * syntax sync fromstart

"""" Colorscheme
set background=dark
silent! colorscheme apprentice
" highlight Normal guibg=#1d2021 guifg=#ebdbb2
" highlight EndOfBuffer guibg=#141413
" highlight Search guibg=#1a561d guifg=#c9d7e0
" highlight IncSearch guibg=#edb825 guifg=#1a561d
" highlight Comment cterm=italic gui=italic
" highlight SpecialKey guifg=#5c6370 guibg=NONE
" highlight Visual guifg=NONE guibg=#010101
" highlight NonText guifg=#5c6370 guibg=NONE
" highlight VertSplit guibg=#111111 guifg=#111111 ctermbg=233  ctermfg=233
" highlight LineNr guibg=#141413 guifg=#5c6370
" highlight CursorLineNr guifg=#ebdbb2
" highlight Include guifg=#9A93E1 ctermfg=81 cterm=italic gui=italic
" highlight Keyword cterm=italic gui=italic
" highlight Type cterm=italic gui=italic
" highlight jsThis cterm=italic gui=italic
" highlight jsFunction cterm=italic gui=italic
" highlight jsModuleAsterisk cterm=italic gui=italic
" highlight jsStorageClass cterm=italic gui=italic
" highlight jsExportDefault cterm=italic gui=italic
" highlight jsObjectKey cterm=italic gui=italic
" highlight jsObjectFuncName cterm=italic gui=italic ctermfg=14 guifg=#83AFE5
" highlight jsClassFuncName cterm=italic gui=italic ctermfg=14 guifg=#83AFE5
" highlight ALEWarningSign guibg=NONE guifg=DarkYellow
" highlight ALEErrorSign guibg=NONE guifg=DarkMagenta
" highlight DiffAdd    ctermbg=DarkGreen   guibg=DarkGreen
" highlight DiffChange ctermbg=DarkMagenta guibg=DarkMagenta
" highlight DiffDelete ctermbg=DarkRed     guibg=DarkRed
" highlight DiffText   ctermbg=Blue        guibg=Blue
highlight IsModified guibg=DarkMagenta
highlight IsNotModified guibg=DarkGreen
