"""" encoding
set encoding=utf-8
scriptencoding utf-8

"""" startup time
augroup vimRc
  autocmd!
augroup END

if has('vim_starting') && has('reltime')
  let s:startuptime = reltime()
  au vimRc VimEnter * let s:startuptime = reltime(s:startuptime) | redraw
        \ | echomsg 'startuptime: ' . reltimestr(s:startuptime)
endif

"""" vim 8 defaults
unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

"""" environment
"" plugins
let s:minpacDir = expand('~/.vim/pack/minpac/opt/minpac')
if !isdirectory(s:minpacDir)
  exe '!git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac'
endif

"" backup, swap, undo
if !isdirectory($HOME.'/.cache/vim/undo-dir')
  call mkdir($HOME.'/.cache/vim/undo-dir', 'p')
endif
set undodir=~/.cache/vim/undo-dir
set undofile
set nobackup
set noswapfile

"" viminfo
set viminfo=!,'300,<50,s10,h,n$HOME/.cache/vim/.viminfo

"" path
set path=.,,**

"""" minpac
call plugpac#begin()

Pack 'k-takata/minpac', {'type': 'opt'}

Pack 'dense-analysis/ale', {'type': 'opt'}
autocmd vimRc BufReadPost * packadd ale

Pack 'Yggdroot/LeaderF', {'type': 'opt', 'on': 'Leaderf'}
let g:Lf_WindowHeight = 0.30
let g:Lf_CursorBlink = 0
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewHorizontalPosition = 'center'
let g:Lf_PopupColorscheme = 'default'
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_ShortcutF = '<C-P>'
nnoremap <c-p> :Leaderf file<cr>
nnoremap <bs> :Leaderf buffer<cr>
command! Rg LeaderfRgInteractive

Pack 'prabirshrestha/asyncomplete.vim'
Pack 'prabirshrestha/async.vim'
Pack 'prabirshrestha/vim-lsp'
Pack 'prabirshrestha/asyncomplete-lsp.vim'

" Pack 'ctrlpvim/ctrlp.vim', {'type': 'opt', 'on': ['CtrlP', 'CtrlPBuffer']}
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_use_caching = 0
" let g:ctrlp_show_hidden = 1
" let g:ctrlp_follow_symlinks = 1
" nnoremap <c-p> :CtrlP<cr>
" nnoremap <bs> :CtrlPBuffer<cr>
" nnoremap <C-t> :CtrlPCurFile<cr>
" if executable('fd')
"   let g:ctrlp_user_command = 'fd --color=never --hidden --follow --exclude .git --exclude pack --type file . %s'
" endif

Pack 'sgur/vim-editorconfig', {'type': 'opt'}
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}
autocmd vimRc BufReadPre * packadd vim-editorconfig

Pack 'tpope/vim-fugitive', {'type': 'opt', 'on': 'Gstatus'}
autocmd vimRc BufReadPre * packadd vim-fugitive
nnoremap [git]  <Nop>
nmap <space>g [git]
nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>
nnoremap <silent> [git]l :<C-u>GV --all<CR>
function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
endfunction
autocmd vimRc FileType fugitive call InFugitive()

Pack 'airblade/vim-gitgutter', {'type': 'opt'}
autocmd vimRc VimEnter * packadd vim-gitgutter

Pack 'tomtom/tcomment_vim', {'type': 'opt'}
autocmd vimRc BufReadPost * packadd tcomment_vim

Pack 'tpope/vim-surround', {'type': 'opt'}
let g:surround_no_insert_mappings = 1
let surround_indent=1
nmap S ysiw
autocmd vimRc BufReadPost * packadd vim-surround

Pack 'tpope/vim-dispatch', {'type': 'opt', 'on': 'Dispatch'}
Pack 'tpope/vim-repeat'
Pack 'fcpg/vim-spotlightify', {'type': 'opt'}
autocmd vimRc BufReadPost * packadd vim-spotlightify

Pack 'markonm/traces.vim', {'type': 'opt'}
autocmd vimRc BufReadPost * packadd traces.vim

Pack 'junegunn/vim-easy-align', {'type': 'opt', 'on': '<Plug>(EasyAlign)'}
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

Pack 'linjiX/vim-star', {'type': 'opt', 'on': '<Plug>(star-*)'}
vmap <silent> * <Plug>(star-*)
vmap <silent> # <Plug>(star-#)
nmap <silent> * <Plug>(star-*)
nmap <silent> # <Plug>(star-#)

Pack 'gabesoft/vim-ags', {'type': 'opt', 'on': 'Ags'}
let g:ags_winplace = 'right'
nnoremap <leader>a :Ags<space>
nnoremap <leader>w :Ags<cr>

Pack 'machakann/vim-highlightedyank', {'type': 'opt'}
let g:highlightedyank_highlight_duration = 200
autocmd vimRc BufReadPost * packadd vim-highlightedyank

Pack 'wellle/targets.vim', {'type': 'opt'}
autocmd vimRc BufReadPost * packadd targets.vim

Pack 'haya14busa/vim-edgemotion', {'type': 'opt', 'on': ['<Plug>(edgemotion-j)', '<Plug>(edgemotion-k)']}
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

Pack 'samoshkin/vim-mergetool', {'type': 'opt', 'on': '<Plug>(MergetoolToggle)'}
let g:mergetool_layout = 'bmr'

Pack 'da-x/conflict-marker.vim', {'type': 'opt', 'on': ['<Plug>(conflict-marker-themselves)', '<Plug>(conflict-marker-ourselves)', '<Plug>(conflict-marker-both)', '<Plug>(conflict-marker-none)', '<Plug>(conflict-marker-next-hunk)', '<Plug>(conflict-marker-prev-hunk)']}
Pack 'hotwatermorning/auto-git-diff', {'type': 'opt', 'for': 'gitrebase'}
Pack 'fcpg/vim-altscreen'
Pack 'rickhowe/diffchar.vim', {'type': 'opt'}
autocmd vimRc BufReadPost * packadd diffchar.vim

Pack 'jonsmithers/vim-html-template-literals', {'type': 'opt'}
Pack 'LnL7/vim-nix', {'type': 'opt'}
Pack 'evanleck/vim-svelte', {'type': 'opt'}
Pack 'kchmck/vim-coffee-script', {'type': 'opt'}
Pack 'plasticboy/vim-markdown', {'type': 'opt'}
Pack 'lumiliet/vim-twig', {'type': 'opt'}
Pack 'lepture/vim-jinja', {'type': 'opt'}
Pack 'yuezk/vim-js', {'type': 'opt'}
Pack 'MaxMEllon/vim-jsx-pretty', {'type': 'opt'}
Pack 'HerringtonDarkholme/yats.vim', {'type': 'opt'}

call plugpac#end()

"""" better defaults
"" moving around/editing
set hidden
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

"" searching and patterns
set hlsearch|nohlsearch
set gdefault

""" windows, buffers
set switchbuf+=useopen,usetab
set splitright
set splitbelow

""" sessions
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=help
set sessionoptions-=curdir
set sessionoptions+=globals
set sessionoptions+=unix

""" Insert completion
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menuone,noselect
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

"" diff
set diffopt+=context:3,indent-heuristic,algorithm:patience

" display
set term=xterm-256color
set t_Co=256
" set termguicolors
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
set signcolumn=auto

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
set notimeout
set updatetime=50

set laststatus=2
set statusline=
set statusline+=%<%{toupper(mode())}
set statusline+=%4c
set statusline+=\ %{expand('%:p:h:t')}
set statusline+=/%t
set statusline+=%h%r
set statusline+=\ %#search#
set statusline+=%{&modified?'+++':''}
set statusline+=%*
set statusline+=%=
set statusline+=%{&filetype!=#''?&filetype:''}

"""" mappings
nnoremap <silent> j gj
nnoremap <silent> k gk
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
nnoremap <expr> <C-f> max([winheight(0) - 2, 1])
      \ . "\<C-d>" . (line('w$') >= line('$') ? "L" : "M")
nnoremap <expr> <C-b> max([winheight(0) - 2, 1])
      \ . "\<C-u>" . (line('w0') <= 1 ? "H" : "M")

"""" windows
nnoremap <silent> <Tab> :wincmd w<CR>
nnoremap <silent> <S-Tab> :wincmd W<CR>

"""" prev and next buffer
" nnoremap ]b :bnext<cr>
" nnoremap [b :bprev<cr>

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

"""" delete buffers
nnoremap <space>b :ls<cr>:bd<space>

"""" substitute.
nnoremap [subst]   <Nop>
nmap   s [subst]
xmap   s [subst]
nnoremap [subst]s :%s/
nnoremap [subst]l :s//<left>
xnoremap [subst]  :s/
nnoremap [subst]a :<c-u>%s/\C\<<c-r><c-w>\>/<c-r><c-w>
nnoremap [subst]p vip :<c-u>s/
nnoremap [subst]w :<C-u>%s/\C\<<C-R><C-w>\>//g<Left><Left>

"""" zoom
nnoremap <C-w>t :tabedit %<cr>
nnoremap <C-w>z :tabclose<cr>

"""" git commands
nnoremap <silent> <expr> <space>dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"

"""" hlsearch
nnoremap <silent>n n
nnoremap <silent>N N
nnoremap <silent> <space>n :nohlsearch<CR>

" CTRL-L to fix syntax highlight
nnoremap <silent><expr> <C-l> empty(get(b:, 'current_syntax'))
      \ ? "\<C-l>"
      \ : "\<C-l>:syntax sync fromstart\<CR>"

filetype plugin indent on
syntax on

set background=dark
silent! colorscheme darkbase
highlight Comment        guifg=#5c6370 guibg=NONE    gui=italic cterm=italic
highlight MatchParen guifg=#b8d68b guibg=#000080 term=reverse
highlight link agsvFilePath Todo
highlight link agsvLineNum Comment
highlight link agsvResultPattern IncSearch
highlight ALEErrorSign ctermfg=9 ctermbg=none
highlight ALEWarningSign ctermfg=11 ctermbg=none

set secure
