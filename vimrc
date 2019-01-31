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

syntax enable
filetype plugin indent on

autocmd MyAutoCmd BufEnter * syntax sync fromstart

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

"""" termguicolors
if !has('gui_running')
      \ && exists('+termguicolors')
  if !has('nvim')
    let &t_8f = "\e[38;2;%lu;%lu;%lum"
    let &t_8b = "\e[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif

"""" arrow keys
if (&term =~# '^tmux') || (&term =~# '^st-256color')
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
nnoremap <silent>v  :<C-u>vsplit<CR>
nnoremap <silent>s  :<C-u>split<CR>
nnoremap <silent>o  :<C-u>only<CR>
nnoremap <silent>c  :<C-u>close<CR>

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

"""" environment
function! s:EnsureDirExists(path)
  if !isdirectory(expand(a:path))
    call mkdir(expand(a:path), 'p')
  endif
endfunction

let $CACHE = expand('$HOME/.cache/vimcache')
silent! call s:EnsureDirExists($CACHE)

"""" viminfo
set viminfo=!,'300,<50,s10,h,n$CACHE/viminfo

"""" shell
set shell=/bin/sh

"""" path
set path& | let &path .= '**'

" Default home directory.
let t:cwd = getcwd()

"""" backup
set nobackup
set nowritebackup

"""" swap and undo
set directory-=.
set noswapfile
set history=1000
set undodir=$CACHE/undo//
set undofile
silent! call s:EnsureDirExists(&undodir)

"""" moving around/editing
set nostartofline
set nowrap
set virtualedit=block
set scrolloff=3
set sidescrolloff=10
set sidescroll=1
set nostartofline
let &showbreak = '↳ '
set breakat=\ \ ;:,!?
set breakindent
set breakindentopt=sbr
set backspace=indent,eol,start
set showmatch
set matchtime=2
set nrformats-=octal
set display=lastline

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
set ruler

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
set shortmess+=Ia
set laststatus=2

set statusline=
set statusline+=%(%{&buflisted?bufnr('%'):''}\ \ %)
set statusline+=%<
set statusline+=%t
set statusline+=%{&modified?'\ +':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=\ %1*
set statusline+=%=
set statusline+=%*
set statusline+=\ %{exists('g:loaded_fugitive')?\ fugitive#head():''}
set statusline+=\ %*
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=\ %*
set statusline+=\ %-3c
set statusline+=:%{printf('%'.(len(line('$'))).'d/%d',line('.'),line('$'))}

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
set wildmode=longest:full,full
set wildcharm=<C-Z>

"""" update time
set updatetime=500

"""" time out on key codes but not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10
set ttyfast
set lazyredraw

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
command! -nargs=0 SS call LoadSession()

autocmd MyAutoCmd VimLeave * :call MakeSession()

let g:is_bash = 1
let g:sh_noisk = 1

""" mappings
" nnoremap <Bs> :ls<CR>:b
nnoremap <space>b :b <C-d>
nnoremap <leader>f :find *
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
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
" replace a word with clipboard
nnoremap <space>w viw"+p
" paste from clipboard
nnoremap <space>p :put+<CR>
vnoremap <space>p "+p
nnoremap <space>P :put!+<CR>
vnoremap <space>P "+P
" yank to clipboard
vnoremap <space>y "+y
" substitute
nnoremap gs :%s/
xnoremap gs :s//<Left>
nnoremap gl :s//g<Left><Left>
" substitute word under the cursor
nnoremap gw :%s/\<<c-r><c-w>\>/
" append text
nnoremap ga :%s/\<<C-r><C-w>\>/<C-r><C-w>
" zoom buffer
nnoremap <space>z :tab split<CR>
nnoremap <space>q :tabclose<CR>
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

" nohlsearch
nnoremap <space>n :nohlsearch<CR>

" add a blank line above/below
nnoremap ]<space> m`o<Esc>``
nnoremap [<space> m`O<Esc>``

"""" search with vimgrep in buffer
nnoremap <leader>l :vimgrep //j %<BAR>cw<s-left><s-left><right>
nnoremap <leader>g :vimgrep //j **<BAR>cw<s-left><s-left><right>

"""" whitespace
command! WS %s/\s\+$// | normal! ``

" """" grep
function! s:vgrep(args)
  let l:grep_command = 'grep --exclude-dir={.git,tag} -nHRI'
  let expr = l:grep_command.' '.a:args
  cgetexpr system(expr)
  cwindow
  let @/=a:args
  setlocal hlsearch
  echo 'Number of matches: ' . len(getqflist())
endfunction

command! -nargs=+ VG :call s:vgrep(<q-args>)

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

"""" fzy
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . ' | fzy ')
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <c-p> :call FzyCommand("fd --type f --hidden --exclude '.git' .", ":e")<cr>

"""" grepper
let g:grepper = {}
let g:grepper.highlight = 1

"""" bufferhint
nnoremap <Bs> :call bufferhint#Popup()<cr>
nnoremap \' :call bufferhint#LoadPrevious()<cr>

"""" comfortable motion
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

"""" mundo
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

"""" alingta
vnoremap i: :Alignta =><Space>
vnoremap <silent> i= :Alignta => =/1<CR>

"""" highlightedyank
let g:highlightedyank_highlight_duration = 200

"""" tagbar
nnoremap <leader>t :TagbarOpenAutoClose<cr>

"""" quickrun
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

"""" cool
let g:CoolTotalMatches = 1

"""" search
cnoremap <expr> <Tab>   getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>/<C-r>/" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ? "<CR>?<C-r>/" : "<S-Tab>"

"""" paste inline
function! ZeroPaste(p)
  let l:original_reg = getreg(v:register)
  let l:stripped_reg = substitute(l:original_reg, '\v^%(\n|\s)*(.{-})%(\n|\s)*$', '\1', '')
  call setreg(v:register, l:stripped_reg, 'c')
  exe 'normal "' . v:register . a:p
  call setreg(v:register, l:original_reg)
endfunction
nnoremap <silent> zp :<c-u>call ZeroPaste('p')<cr>
nnoremap <silent> zP :<c-u>call ZeroPaste('P')<cr>

"""" jsx
let g:jsx_ext_required = 0

"""" filetype
autocmd MyAutoCmd BufRead,BufNewFile *  setfiletype txt
autocmd MyAutoCmd BufNewFile,BufRead *.vim set filetype=vim
autocmd MyAutoCmd BufNewFile,BufRead *.twig set filetype=html.twig
autocmd MyAutoCmd BufNewFile,BufRead *.nix set filetype=nix
autocmd MyAutoCmd BufNewFile,BufRead *.md set filetype=markdown
autocmd MyAutoCmd BufNewFile,BufRead *.ldg,*.ledger set filetype=ledger
autocmd MyAutoCmd BufNewFile,BufRead *.j2 set filetype=jinja
autocmd MyAutoCmd BufNewFile,BufRead *.js set filetype=javascript
autocmd MyAutoCmd BufNewFile,BufRead *.html set filetype=html
autocmd MyAutoCmd BufNewFile,BufRead *.fish setlocal filetype=fish
autocmd MyAutoCmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd MyAutoCmd BufNewFile,BufRead *.yamllint set filetype=yaml

" quickfix on entire tab
autocmd MyAutoCmd FileType qf wincmd J
autocmd MyAutoCmd FileType qf nnoremap <silent><buffer> <space>q :q<CR>

" quit help
autocmd MyAutoCmd FileType help nnoremap <silent><buffer> <space>q :q<CR>

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

" Update diff.
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif
autocmd MyAutoCmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif

"""" Colorscheme
set background=dark
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
silent! colorscheme gruvbox8_hard
hi StatusLine cterm=reverse gui=reverse ctermfg=14 ctermbg=8 guifg=#3b3f3f guibg=#ffffff
hi StatusLineNC cterm=reverse gui=reverse ctermfg=11 ctermbg=0 guifg=#3e4647 guibg=#073642
hi User1 ctermfg=14 ctermbg=0 guifg=#3b3f3f guibg=#262730

set secure
