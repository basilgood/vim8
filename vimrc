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
  call minpac#add('mhinz/vim-signify', {'type': 'opt'})
  call minpac#add('sheerun/vim-polyglot', {'type': 'opt'})
  call minpac#add('prabirshrestha/asyncomplete.vim', {'type': 'opt'})
  call minpac#add('prabirshrestha/asyncomplete-lsp.vim', {'type': 'opt'})
  call minpac#add('prabirshrestha/async.vim')
  call minpac#add('prabirshrestha/vim-lsp', {'type': 'opt'})
  call minpac#add('neomake/neomake', {'type': 'opt'})
endif

if has('vim_starting') && has('timers')
  autocmd vimRc VimEnter * call timer_start(1, 'PackLoad', {'repeat': 0})
endif

function! PackLoad(timer)
  execute 'packadd vim-fugitive'
  doautocmd fugitive BufReadPost
  execute 'packadd vim-lsp'
  doautocmd lsp_auto_enable VimEnter
  execute 'packadd asyncomplete-lsp.vim'
  execute 'packadd asyncomplete.vim'
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
  execute 'packadd vim-polyglot'
  execute 'packadd traces.vim'
  execute 'packadd vim-parenmatch'
  execute 'packadd hlyank.vim'
  execute 'packadd vim-multiple-cursors'
  execute 'packadd ferret'
  execute 'packadd vim-mergetool'
  execute 'packadd conflict-marker.vim'
  execute 'packadd auto-git-diff'
  execute 'packadd vim-signify'
  execute 'packadd neomake'
endfunction

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

"""" asyncomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

"""" lsp
let g:lsp_preview_doubletap = [function('lsp#ui#vim#output#closepreview')]
let g:lsp_preview_autoclose = 0
let g:lsp_fold_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_priority = 11
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': '_e'}
let g:lsp_signs_warning = {'text': '_w'}
let g:lsp_signs_information = {'text': '_i'}
let g:lsp_signs_hint = {'text': '_h'}
let g:lsp_async_completion = 1

function! s:configure_lsp() abort
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gD <plug>(lsp-type-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol)
  nmap <buffer> gS <plug>(lsp-workspace-symbol)
  nmap <buffer> gQ <plug>(lsp-document-format)
  vmap <buffer> gQ <plug>(lsp-document-format)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gR <plug>(lsp-declaration)
  nmap <buffer> [p <plug>(lsp-previous-error)
  nmap <buffer> ]p <plug>(lsp-next-error)
  nmap <buffer> ]a <plug>(lsp-code-action)
  nmap <buffer> K  <plug>(lsp-hover)
  nmap <buffer> <F1> :<C-u>LspImplementation<CR>
  nmap <buffer> <F2> :<C-u>LspRename<CR>
  setlocal omnifunc=lsp#complete
endfunction

let g:lsp_diagnostics_echo_cursor = 1
augroup lsp_lsp
  autocmd! *
  if executable('typescript-language-server')
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'typescript-language-server',
          \ 'cmd': { server_info -> [&shell, &shellcmdflag, 'typescript-language-server --stdio'] },
          \ 'whitelist': ['javascript', 'typescript'],
          \})
    autocmd FileType javascript call s:configure_lsp()
    autocmd FileType typescript call s:configure_lsp()
  endif

  if executable('html-languageserver')
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'html-languageserver',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'npx vscode-html-languageserver-bin --stdio']},
          \ 'whitelist': ['html'],
          \ })
    autocmd FileType html call s:configure_lsp()
  endif

  if executable('efm-langserver')
    if executable('vint')
      autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'efm-langserver-vint',
            \ 'cmd': { server_info -> ['efm-langserver', '-stdin', &shell, &shellcmdflag, 'vint -'] },
            \ 'whitelist': ['vim'],
            \})
      autocmd FileType vim call s:configure_lsp()
    endif
  endif
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
set ttymouse=sgr
set tabline=%!functions#tabline()
set t_ut=
set cursorline
set list
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮,nbsp:⦸
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
set updatetime=100

set laststatus=2
let &g:statusline=''
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

"""" search and star search
" nnoremap * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
" nnoremap cn :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>cgn
" nnoremap dn :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>cgn
" vnoremap * :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>

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
autocmd vimRc FocusGained,CursorHold * if !bufexists("[Command Line]") | checktime | endif

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
