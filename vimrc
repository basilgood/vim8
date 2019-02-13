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

let g:loaded_matchit = 1
autocmd MyAutoCmd BufEnter * syntax sync fromstart

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
if (&term =~# '^tmux') || (&term =~# '^xterm-kitty')
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

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

" default home directory.
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
set statusline+=%#IsModified#%{&mod?'\ +\ +\ +':''}
set statusline+=%#IsNotModified#%{&mod?'\ ':''}
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
nnoremap <leader>s :%s/
vnoremap <leader>s :s/
" substitute word under the cursor
nnoremap <leader>w :%s/\<<c-r><c-w>\>/
" append text
nnoremap <leader>a :%s/\<<C-r><C-w>\>/<C-r><C-w>
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

"""" add a blank line above/below
nnoremap ]<space> m`o<Esc>``
nnoremap [<space> m`O<Esc>``

"""" search with vimgrep in buffer
nnoremap <leader>l :vimgrep //j %<BAR>cw<s-left><s-left><right>

"""" plugins
let g:netrw_localrmdir='rm -r'
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
let g:netrw_sort_dotfiles_first = 1

function! InNetrw()
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> = G<cr>
  nmap <buffer> l qf
endfunction

autocmd MyAutoCmd FileType netrw call InNetrw()

"""" ale
let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0
let g:ale_sign_info = 'i'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \ 'node_modules/': { 'ale_enabled': 0 },
      \}
let g:ale_fix_on_save = 1
let g:ale_sign_warning = '──'
let g:ale_sign_error = '══'

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
nmap ]a <Plug>(ale_next_wrap)
nmap [a <Plug>(ale_previous_wrap)

"""" grepper
let g:grepper = {}
let g:grepper.highlight = 1

"""" bufferhint
nnoremap <Bs> :call bufferhint#Popup()<cr>
nnoremap \' :call bufferhint#LoadPrevious()<cr>

"""" comfortable motion
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

"""" undotree
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
nnoremap U :UndotreeToggle<CR>

"""" alingta
vnoremap i: :Alignta =><Space>
vnoremap <silent> i= :Alignta => =/1<CR>

"""" highlightedyank
let g:highlightedyank_highlight_duration = 200

"""" tagbar
nnoremap <leader>t :TagbarOpenAutoClose<cr>

"""" cool
let g:CoolTotalMatches = 1

"""" jsx
let g:jsx_ext_required = 0

"""" matchup
let g:matchup_matchparen_deferred = 1

"""" filetype
autocmd MyAutoCmd BufRead,BufNewFile * setfiletype txt
autocmd MyAutoCmd BufRead,BufNewFile *.gitignore  set filetype=gitignore
autocmd MyAutoCmd BufNewFile,BufRead *.vim set filetype=vim
autocmd MyAutoCmd BufNewFile,BufRead *.twig set filetype=html.twig
autocmd MyAutoCmd BufNewFile,BufRead *.nix set filetype=nix
autocmd MyAutoCmd BufNewFile,BufRead *.md set filetype=markdown
autocmd MyAutoCmd BufNewFile,BufRead .ledger set filetype=ledger
autocmd MyAutoCmd BufNewFile,BufRead *.j2 set filetype=jinja
autocmd MyAutoCmd BufNewFile,BufRead *.js set filetype=javascript
autocmd MyAutoCmd BufNewFile,BufRead *.html set filetype=html
autocmd MyAutoCmd BufNewFile,BufRead *.fish setlocal filetype=fish
autocmd MyAutoCmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd MyAutoCmd BufNewFile,BufRead *.yamllint set filetype=yaml
autocmd MyAutoCmd BufNewFile,BufRead *.yml set filetype=yaml

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

" update diff
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

" external changes
autocmd MyAutoCmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif

" keep clipboard content
autocmd MyAutoCmd VimLeave * call system("xclip -sel clip -i", getreg('+'))

" qf and help keep widow full width
autocmd MyAutoCmd FileType qf wincmd J
autocmd MyAutoCmd BufWinEnter * if &ft == 'help' | wincmd J | end


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
highlight IsModified ctermbg=237 ctermfg=160
hi MatchParen ctermbg=NONE guibg=NONE ctermfg=175 guifg=#d3869b cterm=NONE gui=NONE

set secure
