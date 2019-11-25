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
  call minpac#add('neoclide/coc.nvim', {'type': 'opt', 'branch': 'release'})
  call minpac#add('tpope/vim-fugitive', {'type': 'opt'})
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
  call minpac#add('wincent/ferret', {'type': 'opt'})
  call minpac#add('itchyny/vim-parenmatch', {'type': 'opt'})
  call minpac#add('markonm/hlyank.vim', {'type': 'opt'})
  call minpac#add('terryma/vim-multiple-cursors', {'type': 'opt'})
  call minpac#add('samoshkin/vim-mergetool', {'type': 'opt'})
  call minpac#add('da-x/conflict-marker.vim', {'type': 'opt'})
  call minpac#add('hotwatermorning/auto-git-diff', {'type': 'opt'})
  call minpac#add('chemzqm/vim-jsx-improve', {'type': 'opt'})
  call minpac#add('chemzqm/jsonc.vim', {'type': 'opt'})
  call minpac#add('jonsmithers/vim-html-template-literals', {'type': 'opt'})
  call minpac#add('lumiliet/vim-twig', {'type': 'opt'})
  call minpac#add('lepture/vim-jinja', {'type': 'opt'})
  call minpac#add('HerringtonDarkholme/yats.vim', {'type': 'opt'})
  call minpac#add('plasticboy/vim-markdown', {'type': 'opt'})
  call minpac#add('kchmck/vim-coffee-script', {'type': 'opt'})
  call minpac#add('elzr/vim-json', {'type': 'opt'})
  call minpac#add('stephpy/vim-yaml', {'type': 'opt'})
  call minpac#add('evanleck/vim-svelte', {'type': 'opt'})
  call minpac#add('neoclide/jsonc.vim', {'type': 'opt'})
  call minpac#add('LnL7/vim-nix', {'type': 'opt'})
  call minpac#add('neomake/neomake', {'type': 'opt'})
endif

if has('vim_starting') && has('timers')
  autocmd vimRc VimEnter * call timer_start(1, 'PackLoad', {'repeat': 0})
endif

function! PackLoad(timer)
  execute 'packadd coc.nvim'
  execute 'packadd vim-fugitive'
  doautocmd fugitive BufReadPost
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
  execute 'packadd vim-jsx-improve'
  execute 'packadd jsonc.vim'
  execute 'packadd typescript-vim'
  execute 'packadd vim-jsx-typescript'
  execute 'packadd vim-html-template-literals'
  execute 'packadd vim-twig'
  execute 'packadd vim-jinja'
  execute 'packadd yats.vim'
  execute 'packadd vim-markdown'
  execute 'packadd vim-coffee-script'
  execute 'packadd vim-json'
  execute 'packadd vim-yaml'
  execute 'packadd vim-svelte'
  execute 'packadd jsonc.vim'
  execute 'packadd vim-nix'
  execute 'packadd traces.vim'
  execute 'packadd vim-parenmatch'
  execute 'packadd hlyank.vim'
  execute 'packadd vim-multiple-cursors'
  execute 'packadd ferret'
  execute 'packadd vim-mergetool'
  execute 'packadd conflict-marker.vim'
  execute 'packadd auto-git-diff'
  execute 'packadd neomake'
endfunction

" coc.nvim
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-css',
      \ 'coc-stylelintplus',
      \ 'coc-html',
      \ 'coc-svelte',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-git',
      \ 'coc-eslint',
      \ 'coc-yaml',
      \ 'coc-vimlsp',
      \ ]

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap gs <Plug>(coc-git-chunkinfo)
nmap gm <Plug>(coc-git-commit)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ functions#check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Format :call CocAction('format')

"""" netrw
let g:netrw_bufsettings         = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted hidden'
let g:netrw_sort_dotfiles_first = 1
let g:netrw_altfile             = 1
let g:netrw_dirhistmax          = 0
autocmd vimRc FileType netrw call functions#innetrw()

"""" neomake
let g:neomake_warning_sign = {
      \ 'text': '_w',
      \ }
let g:neomake_error_sign = {
      \ 'text': '_e',
      \ }
augroup my_neomake
  au!
  autocmd FileType nix call neomake#configure#automake_for_buffer('nw', 1000)
augroup END

"""" cool
let g:CoolTotalMatches = 1

"""" editorconfig
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose    = 1
let g:editorconfig_blacklist  = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

"""" surround
let g:surround_no_insert_mappings = 1
let surround_indent=1
nmap S ysiw

"""" easyalign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

"""" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0
nnoremap <bs> :CtrlPBuffer<cr>
nnoremap <C-t> :CtrlPCurFile<cr>
if executable('fd')
  let g:ctrlp_user_command = 'fd --color=never --hidden --follow --exclude .git --exclude pack --type file . %s'
endif
let g:ctrlp_extensions = ['commandline', 'menu']

"""" fruzzy
let g:fruzzy#usenative = 1
let g:ctrlp_match_func = {'match': 'fruzzy#ctrlp#matcher'}
let g:ctrlp_match_current_file = 1

"""" javascript doc
let g:javascript_plugin_jsdoc = 1

"""" ferret
let g:FerretAcksCommand='cfdo'
let g:FerretVeryMagic=0
let g:FerretAutojump=0

"""" mergetool
let g:mergetool_layout = 'bmr'
if &diff == 1
  vmap <silent> <buffer> dg :diffget<CR>
  vmap <silent> <buffer> dp :diffput<CR>
  nmap <silent> <buffer> dg V:diffget<CR>
  nmap <silent> <buffer> dp V:diffput<CR>
endif

"""" git.
nnoremap [git]  <Nop>
nmap [Space]g [git]
nnoremap <silent> [git]s :<C-u>vertical Gstatus<CR>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<CR>
nnoremap <silent> [git]l :<C-u>GV --all<CR>

function! InFugitive() abort
  nmap <buffer> zp :<c-u>Dispatch! git push<CR>
  nmap <buffer> zF :<c-u>Dispatch! git push -f<CR>
endfunction

autocmd vimRc FileType fugitive call InFugitive()

" better defaults
"""" unix and tmux
source $HOME/.vim/unix.vim

"""" path
set path=.,**

"""" backup, swap, undo
if !isdirectory($HOME.'/.cache/vim/undo-dir')
  call mkdir($HOME.'/.cache/vim/undo-dir', 'p')
endif
set undodir=~/.cache/vim/undo-dir
set undofile
set nobackup
set noswapfile
set viewoptions+=cursor,folds,slash,unix
set viewoptions-=options
"""" terminal vim
set notimeout
set ttimeout
set ttimeoutlen=10
set lazyredraw



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
set backspace=indent,eol,start
set noshowmatch
set matchtime=1
set matchpairs&
set nrformats-=octal
set display=lastline

"""" searching and patterns
set incsearch
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
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt-=preview
set completeopt+=menuone,noselect
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10

"""" text formatting
set formatoptions+=j

""""" diff
set diffopt+=context:3,indent-heuristic,algorithm:patience
if &diff
  set t_Co=0
endif

"""" display
set number
set mouse=a
set noshowmode
set ttymouse=sgr
set tabline=%!functions#tabline()
set t_ut=
set cursorline
set list
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮,nbsp:⦸
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•
set termguicolors

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
let &g:statusline=''
let &g:statusline.=' %{toupper(mode())} '
let &g:statusline.='%{expand("%:p:h:t")}/%t'
let &g:statusline.='%8c:%l'
let &g:statusline.=' %h%r'
let &g:statusline.=' %#error#%{&mod?" ✚✚✚ ":""}'
let &g:statusline.='%*'
let &g:statusline.='%='
let &g:statusline.='%{exists("g:loaded_conflicted")?ConflictedVersion():""} '
let &g:statusline.='%{exists("g:loaded_fugitive")?fugitive#head(5):""} '
let &g:statusline.='[%{&filetype!=#""?&filetype:""}]'

"""" mappings
nmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
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
nnoremap gQ <Nop>

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
nnoremap [subst]a :%s/\<<c-r><c-w>\>/<c-r><c-w>
nnoremap [subst]p vip :s/
nnoremap [subst]w :%s/\<<c-r><c-w>\>/

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

"""" commands
command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command! Bd setlocal bufhidden=delete | bnext
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! -nargs=0 HL call functions#hl()
command! -range GB echo join(systemlist("git blame -L <line1>,<line2> " . expand('%')), "\n")
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 OrganiseImports :CocCommand tsserver.organizeImports
command! -nargs=0 FixAllImports :CocCommand tsserver.executeAutoFix

"""" autocmds
"""" If a file is large, disable syntax highlighting, filetype etc
let g:LargeFile = 20*1024*1024 " 20MB
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

"""" update diff
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif

"""" external changes
autocmd vimRc FocusGained,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | checktime | endif

"""" mkdir
autocmd vimRc BufWritePre * call functions#mkdirifnotexist()

"""" cursorline
autocmd vimRc InsertLeave,WinEnter * setlocal cursorline
autocmd vimRc InsertEnter,WinLeave * setlocal nocursorline

"""" fugitive files
autocmd vimRc FileType git setlocal nofoldenable

"""" filetype
autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json setlocal formatoptions=a2tq
autocmd vimRc FileType json syntax match Comment +\/\/.\+$+
autocmd vimRc FileType jsonc setlocal commentstring=//\ %s

call vimrc#on_filetype()

set background=dark
silent! colorscheme nordish
highlight ParenMatch     guifg=#85EB6A guibg=#135B00 gui=NONE   cterm=NONE term=reverse ctermbg=11
highlight Comment        guifg=#5c6370 guibg=NONE    gui=italic cterm=italic
highlight link LspErrorHighlight Error
highlight LspWarningHighlight guifg=#fabd2f guibg=#2E3440 gui=NONE cterm=NONE
highlight LspErrorHighlight guifg=#f93d3d guibg=#2E3440 gui=NONE cterm=NONE

set secure
