set encoding=utf-8
scriptencoding utf-8

augroup vimRc
 autocmd!
augroup END

if has('vim_starting') && has('reltime')
  let s:startuptime = reltime()
  au vimRc VimEnter * let s:startuptime = reltime(s:startuptime) | redraw
        \ | echomsg 'startuptime: ' . reltimestr(s:startuptime)
endif

" Vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

"""" unload
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

"""" plugins
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

let s:plugins = exists('*minpac#init')
if !s:plugins
  fun! InstallPlug()
    exe '!git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac'
  endfun
else
  call minpac#init()
  call minpac#add('dense-analysis/ale', {'type': 'opt'})
  call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
  call minpac#add('airblade/vim-gitgutter', {'type': 'opt'})
  call minpac#add('tpope/vim-vinegar', {'type': 'opt'})
  call minpac#add('tomtom/tcomment_vim', {'type': 'opt'})
  call minpac#add('tpope/vim-repeat', {'type': 'opt'})
  call minpac#add('tpope/vim-surround', {'type': 'opt'})
  call minpac#add('tpope/vim-dispatch', {'type': 'opt'})
  call minpac#add('sgur/vim-editorconfig', {'type': 'opt'})
  call minpac#add('romainl/vim-cool', {'type': 'opt'})
  call minpac#add('wellle/targets.vim', {'type': 'opt'})
  call minpac#add('ctrlpvim/ctrlp.vim', {'type': 'opt'})
  call minpac#add('raghur/fruzzy', {'type': 'opt', 'do': { -> fruzzy#install()}})
  call minpac#add('suy/vim-ctrlp-commandline', {'type': 'opt'})
  call minpac#add('michaeljsmith/vim-indent-object', {'type': 'opt'})
  call minpac#add('junegunn/vim-easy-align', {'type': 'opt'})
  call minpac#add('markonm/traces.vim', {'type': 'opt'})
  call minpac#add('linjiX/vim-star', {'type': 'opt'})
  call minpac#add('gabesoft/vim-ags', {'type': 'opt'})
  call minpac#add('itchyny/vim-parenmatch', {'type': 'opt'})
  call minpac#add('markonm/hlyank.vim', {'type': 'opt'})
  call minpac#add('samoshkin/vim-mergetool', {'type': 'opt'})
  call minpac#add('da-x/conflict-marker.vim', {'type': 'opt'})
  call minpac#add('hotwatermorning/auto-git-diff', {'type': 'opt'})
  call minpac#add('chemzqm/vim-jsx-improve')
  call minpac#add('chemzqm/jsonc.vim')
  call minpac#add('jonsmithers/vim-html-template-literals')
  call minpac#add('lumiliet/vim-twig')
  call minpac#add('lepture/vim-jinja')
  call minpac#add('HerringtonDarkholme/yats.vim')
  call minpac#add('plasticboy/vim-markdown')
  call minpac#add('kchmck/vim-coffee-script')
  call minpac#add('elzr/vim-json')
  call minpac#add('stephpy/vim-yaml')
  call minpac#add('evanleck/vim-svelte')
  call minpac#add('neoclide/jsonc.vim')
  call minpac#add('LnL7/vim-nix')
endif

if has('vim_starting') && has('timers')
  autocmd vimRc VimEnter * call timer_start(1, 'PackLoad', {'repeat': 0})
endif

function! PackLoad(timer)
  execute 'packadd ale'
  execute 'packadd vim-fugitive'
  execute 'packadd vim-gitgutter'
  doautocmd fugitive BufReadPost
  doautocmd gitgutter BufReadPost
  execute 'packadd vim-cool'
  execute 'packadd vim-editorconfig'
  execute 'packadd targets.vim'
  execute 'packadd vim-indent-object'
  execute 'packadd vim-vinegar'
  execute 'packadd tcomment_vim'
  execute 'packadd vim-repeat'
  execute 'packadd vim-surround'
  execute 'packadd vim-dispatch'
  execute 'packadd vim-easy-align'
  execute 'packadd ctrlp.vim'
  execute 'packadd fruzzy'
  execute 'packadd vim-ctrlp-commandline'
  execute 'packadd traces.vim'
  execute 'packadd vim-star'
  execute 'packadd vim-parenmatch'
  execute 'packadd hlyank.vim'
  execute 'packadd vim-ags'
  execute 'packadd vim-mergetool'
  execute 'packadd conflict-marker.vim'
  execute 'packadd auto-git-diff'
endfunction

"""" path
set path=.,,**

"""" backup, swap, undo
if !isdirectory($HOME.'/.cache/vim/undo-dir')
  call mkdir($HOME.'/.cache/vim/undo-dir', 'p')
endif
set undodir=~/.cache/vim/undo-dir
set undofile
set nobackup
set noswapfile

"""" viminfo
set viminfo=!,'300,<50,s10,h,n$HOME/.cache/vim/.viminfo

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
set matchtime=1
set matchpairs&
set display=lastline

"""" searching and patterns
set hlsearch|nohlsearch
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
set completeopt-=preview
set completeopt+=menuone,noselect
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

""""" diff
set diffopt+=context:3,indent-heuristic,algorithm:patience
if &diff
  set t_Co=0
endif

"""" display
set termguicolors
set number
set mouse=a
set ttymouse=sgr
set noshowmode
set tabline=%!Tabline()
set t_ut=
set cursorline
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:‡
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•

"""" messages, info, status
set visualbell t_vb=
set confirm
set showcmd
set shortmess+=IFcms
set signcolumn=yes

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
set wildignore+=
      \*.png,*.jpg,*.pdf,
      \CVS,SVN,
      \node_modules,
      \bower_components
set wildcharm=<C-Z>

"""" update time
set updatetime=50

set laststatus=2
set statusline+=%{toupper(mode())}
set statusline+=%4c
set statusline+=\ %{expand('%:p:h:t')}/
set statusline+=%t
set statusline+=%h%r
set statusline+=\ %m
set statusline+=%=
set statusline+=%{exists('g:loaded_conflicted')?ConflictedVersion():''}
set statusline+=\ %{exists('g:loaded_fugitive')?fugitive#head(5):''}
set statusline+=\ [%{&filetype!=#''?&filetype:''}]

"""" mappings
nnoremap j gj
nnoremap k gk
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv
nnoremap <C-s> :<c-u>update<cr>
inoremap <C-s> <esc>:update<cr>
xnoremap <C-s> <esc>:<C-u>update<cr>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-Del> <C-o>dw
nnoremap } }zz
nnoremap { {zz

" Smart <C-f>, <C-b>.
noremap <expr> <C-f> max([winheight(0) - 2, 1])
      \ . "\<C-d>" . (line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
      \ . "\<C-u>" . (line('w0') <= 1 ? "H" : "M")

"""" windows
nnoremap <silent> <space>v  :<c-u>vsplit<cr>
nnoremap <silent> <space>s  :<c-u>split<cr>
nnoremap <silent> <space>o  :<c-u>only<cr>
nnoremap <silent> <space>q  :<c-u>close<cr>
nnoremap <silent> <Tab> :wincmd w<CR>
nnoremap <silent> <S-Tab> :wincmd W<CR>

"""" prev and next buffer
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

"""" lists
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>

"""" niceblock
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')

"""" innerline
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>

"""" entire
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>

"""" disable EX-mode
nnoremap Q <Nop>

"""" execute macro
nnoremap Q @q
"""" Run macro on selected lines
vnoremap Q :norm Q<cr>

"""" yank to clipboard
vnoremap <space>y "+y

"""" yank and keep cursor position
vnoremap <expr>y "my\"" . v:register . "y`y"

"""" paste from clipboard
nnoremap <space>p :put+<cr>
vnoremap <space>p "+p
nnoremap <space>P :put!+<cr>
vnoremap <space>P "+P

"""" Paste continuously.
nnoremap [p "0p
nnoremap ]p viw"0p
vnoremap P "0p

"""" replace a word with clipboard
nnoremap <space>w viw"+p

"""" switch buffers
nnoremap <space>1 1<c-w>w
nnoremap <space>2 2<c-w>w
nnoremap <space>3 3<c-w>w
nnoremap <space>4 4<c-w>w
nnoremap <space>5 5<c-w>w
nnoremap <space>6 6<c-w>w
nnoremap <space>7 7<c-w>w
nnoremap <space>8 8<c-w>w
nnoremap <space>9 9<c-w>w

"""" substitute.
nnoremap [subst]   <Nop>
nmap   s [subst]
xmap   s [subst]
nnoremap [subst]s :%s/
nnoremap [subst]l :s/
xnoremap [subst]  :s/
nnoremap [subst]a :<c-u>%s/\C\<<c-r><c-w>\>/<c-r><c-w>
nnoremap [subst]p vip :<c-u>s/
nnoremap [subst]w :<C-u>%s/\C\<<C-R><C-w>\>//g<Left><Left>

"""" zoom
nnoremap <C-w>t :tabedit %<cr>
nnoremap <C-w>z :tabclose<cr>

"""" git commands
nnoremap <silent> <expr> <space>dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"

"""" hlsearch hlnext
nnoremap <silent> <space>n :nohlsearch<CR>

" CTRL-L to fix syntax highlight
nnoremap <silent><expr> <C-l> empty(get(b:, 'current_syntax'))
      \ ? "\<C-l>"
      \ : "\<C-l>:syntax sync fromstart\<CR>"


filetype plugin indent on
syntax on

set background=dark
silent! colorscheme nordish
highlight ParenMatch     guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
highlight Comment        guifg=#5c6370 guibg=NONE    gui=italic cterm=italic

set secure
