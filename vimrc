unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

if &encoding !=? 'utf-8'
  let &termencoding = &encoding
  setglobal encoding=utf-8
endif

scriptencoding utf-8

augroup vimRc
  autocmd!
augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd vimRc VimEnter * PlugInstall | source $MYVIMRC
endif

silent! if plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '➤'
let g:ale_sign_info = '➟'
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_echo_msg_format = '%s'
let g:ale_linters = {
      \   'jsx': ['eslint'],
      \   'javascript': ['eslint'],
      \   'typescript': ['eslint']
      \}
let g:ale_fixers = {
      \   'jsx': ['eslint'],
      \   'javascript': ['eslint'],
      \   'typescript': ['eslint'],
      \   'nix': ['nixpkgs-fmt']
      \}
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}
nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)

Plug 'natebosch/vim-lsc'
let g:lsc_server_commands = {'javascript': 'typescript-language-server --stdio'}
let g:lsc_auto_map = {
 \  'GoToDefinition': 'gd',
 \  'FindReferences': 'gr',
 \  'Rename': 'gR',
 \  'ShowHover': 'K',
 \  'FindCodeActions': 'ga',
 \}
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'

Plug 'lifepillar/vim-mucomplete'
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 50
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['omni', 'c-n', 'path', 'tags']
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" netrw
let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_banner = 0
let g:netrw_altfile = 1
let g:netrw_altv = 1
let g:netrw_preview = 1
let g:netrw_alto = 0
let g:netrw_use_errorwindow = 0
let g:netrw_list_hide = '^\.\.\=/\=$'
function! Innetrw() abort
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
endfunction
autocmd vimRc FileType netrw call Innetrw()
nmap - :call Opendir('edit')<CR>
function! Opendir(cmd) abort
    if expand('%') =~# '^$\|^term:[\/][\/]'
        execute a:cmd '.'
    else
        execute a:cmd '%:h'
        let pattern = '^\%(| \)*'.escape(expand('#:t'), '.*[]~\').'[/*|@=]\=\%($\|\t\)'
        call search(pattern, 'wc')
    endif
endfunction

Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

Plug 'srstevenson/vim-picker', { 'on': ['PickerEdit', 'PickerBuffer'] }
let g:picker_selector_executable = 'sk'
let g:picker_selector_flags = ''
let g:picker_custom_find_executable = 'fd'
let g:picker_custom_find_flags = '--type f --hidden --follow --exclude ".git"'
nnoremap <C-p> :PickerEdit<cr>
nnoremap <bs> :PickerBuffer<cr>
function! PickerRgLineHandler(selection) abort
    let parts = split(a:selection, ':')
    return {'filename': parts[0], 'line': parts[1], 'column': parts[2]}
endfunction
command! -nargs=? PickerRg
    \ call picker#File('rg --color never --line-number --column '.shellescape(<q-args>), "edit", {'line_handler': 'PickerRgLineHandler'})

Plug 'editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

Plug 'tpope/vim-repeat'
vnoremap . :normal .<CR>
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'mbbill/undotree', { 'on': 'UndoTreeToggle' }
let g:undotree_CustomUndotreeCmd = 'vertical 50 new'
let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'fcpg/vim-altscreen'
Plug 'vim-scripts/cmdline-completion'
Plug 'hotwatermorning/auto-git-diff'
Plug 'whiteinge/diffconflicts', { 'on': 'DiffConflicts' }
Plug 'markonm/hlyank.vim'
Plug 'markonm/traces.vim'

Plug 'tpope/vim-fugitive', { 'on': ['Gstatus', 'Gvdiffsplit'] }
nnoremap [git]  <Nop>
nmap <space>g [git]
nnoremap <silent> [git]s :<C-u>vertical Gstatus<cr>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<cr>gg

Plug 'basilgood/min.vim'

Plug 'sheerun/vim-polyglot'

call plug#end()
endif

" personal options
set nobackup
set noswapfile

set undodir=/tmp,.
set undofile

if exists('$TMUX')
  set term=xterm-256color
endif
set t_Co=256
set t_ut=
set t_md=

let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

set noswapfile
set nobackup
set undodir=/tmp,.
set undofile
set noerrorbells visualbell t_vb=
set regexpengine=1
set path& | let &path .= '**'
set nostartofline
set nowrap
set virtualedit=block
set sidescrolloff=10
set sidescroll=1
set display=lastline
set incsearch
set hlsearch|nohlsearch
set gdefault
set switchbuf+=useopen,usetab
set splitright
set splitbelow
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10
set diffopt+=vertical,context:3,indent-heuristic,algorithm:patience
set nrformats-=octal
set number
set mouse=a
set ttyfast
set ttymouse=sgr
set backspace=indent,eol,start
set history=200
set wildmenu
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:⣿
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•
set confirm
set shortmess+=IOFc
set autoindent
set copyindent
set preserveindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoread
set autowrite
set helplang=en
set spelllang=en_us
set history=1000
set wildmode=longest:list,full
set wildignorecase
set wildignore=
      \*/node_modules/*,
      \*/.git/*
set wildcharm=<C-Z>
set ttimeout
set timeoutlen=1000
set ttimeoutlen=0
set updatetime=50
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
endif
set grepformat^=%f:%l:%c:%m
set laststatus=2
set statusline=%<%f\ %h%#error#%m%*%r%=%-14.(%l\:%c%)%{&filetype}

" mappings
nnoremap <leader><leader> :update<cr>
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap } }zz
nnoremap { {zz
nnoremap vv viw
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]L :llast<cr>
nnoremap [L :lfirst<cr>
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>
vnoremap <expr>y "my\"" . v:register . "y`y"
nmap  <Space>   [Space]
vmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap <silent> [Space]y y:call system("wl-copy", @")<cr>
nnoremap [Space]p :let @"=substitute(system("wl-paste -n"), '<C-v><C-m>', '', 'g')<cr>:put<cr>
nnoremap [Space]w diw:let @"=substitute(system("wl-paste -n"), '<C-v><C-m>', '', 'g')<cr>P
xnoremap [Space]p d:let @"=substitute(system("wl-paste -n"), '<C-v><C-m>', '', 'g')<cr>P
vnoremap P "0p
nnoremap ss :%s/
nnoremap sl :s/
xnoremap s  :s/
nnoremap sa :<c-u>%s/\C\<<c-r><c-w>\>/<c-r><c-w>
nnoremap sw :<C-u>%s/\C\<<C-R><C-w>\>//g<Left><Left>
nnoremap <silent> <expr> [Space]dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"
nnoremap <silent> <C-g> :file<Bar>echon ' ' system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")<CR>
nnoremap <silent><expr> <C-l> empty(get(b:, 'current_syntax'))
      \ ? "\<C-l>"
      \ : "\<C-l>:syntax sync fromstart\<cr>:nohlsearch<cr>"
nnoremap <silent>n n
nnoremap <silent>N N
" vim-visual-star-search
nnoremap <silent> * *``
nnoremap sn *``cgn
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>``
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
" execute macro
nnoremap Q <Nop>
nnoremap Q @q
" Run macro on selected lines
vnoremap Q :norm Q<cr>
" find
nnoremap [Space]f :find *<c-z>

" omnicomplete
autocmd vimRc Filetype *
      \ if &omnifunc == "" |
      \   setlocal omnifunc=syntaxcomplete#Complete |
      \ endif

" format
autocmd vimRc FileType nix setlocal makeprg=nix-instantiate\ --parse
autocmd vimRc FileType nix setlocal formatprg=nixpkgs-fmt
autocmd vimRc BufRead,BufNewFile *.nix command! F silent call system('nixpkgs-fmt ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx command! F silent call system('prettier --single-quote --write ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx command! Fix silent call system('eslint --fix ' . expand('%'))
autocmd vimRc FileType yaml command! F silent call system('prettier --write ' . expand('%'))
autocmd vimRc FileType sh command! F silent call system('shfmt -i 2 -ci -w ' . expand('%'))

" If a file is large, disable syntax highlighting, filetype etc
let g:LargeFile = 20*1024*1024 " 20MB
autocmd vimRc BufReadPre *
      \ let s = getfsize(expand("<afile>")) |
      \ if s > g:LargeFile || s == -2 |
      \   call functions#large_file(fnamemodify(expand("<afile>"), ":p")) |
      \ endif

" qf and help keep widow full width
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end

" update diff
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif

" detect filetype on save
autocmd vimRc BufWritePost * if &filetype ==# '' | filetype detect | endif

" external changes
autocmd vimRc FocusGained,CursorHold *
      \ if !bufexists("[Command Line]") |
      \ checktime |
      \ if exists('g:loaded_gitgutter') |
      \   call gitgutter#all(1) |
      \ endif

" Automatically set expandtab
autocmd vimRc FileType * execute 'setlocal ' . (search('^\t.*\n\t.*\n\t', 'n') ? 'no' : '') . 'expandtab'

" Set nonumber in terminal window
autocmd vimRc BufWinEnter * if &l:buftype == 'terminal' | setlocal nonumber | endif

" mkdir
autocmd vimRc BufWritePre *
      \ if !isdirectory(expand('%:h', v:true)) |
      \   call mkdir(expand('%:h', v:true), 'p') |
      \ endif

" filetypes
autocmd vimRc BufNewFile,BufRead *.gitignore  setfiletype gitignore
autocmd vimRc BufNewFile,BufRead *.twig       setfiletype twig.html
autocmd vimRc BufNewFile,BufRead config       setfiletype config
autocmd vimRc BufNewFile,BufRead *.lock       setfiletype config
autocmd vimRc BufNewFile,BufRead .babelrc     setfiletype json
autocmd vimRc BufNewFile,BufRead *.txt        setfiletype markdown
autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json  setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json  setlocal formatoptions=
autocmd vimRc FileType git       setlocal nofoldenable

command! DF call delete(expand('%')) | bdelete!
command! -nargs=0 WS %s/\s\+$// | normal! ``
function! Hlgroup() abort
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
command! HL call Hlgroup()
command! -nargs=1 TV
      \ call system('tmux split-window -h '.<q-args>)
command! TA TV tig --all
command! TS TV tig status

function! s:safeundo()
  let s:pos = getpos( '. ')
  let s:view = winsaveview()
  undo
  call setpos( '.', s:pos )
  call winrestview( s:view )
endfunc

function! s:saferedo()
  let s:pos = getpos( '.' )
  let s:view = winsaveview()
  redo
  call setpos( '.', s:pos )
  call winrestview( s:view )
endfunc

nnoremap u :call <sid>safeundo() <CR>
nnoremap <C-r> :call <sid>saferedo() <CR>

command! -complete=shellcmd -nargs=+ Shell call s:TmpShellOutput(<q-args>)
function! s:TmpShellOutput(cmdline) abort
	if bufexists('tmplog')
		call deletebufline('tmplog', 1, '$')
	else
		call bufadd('tmplog')
		call setbufvar('tmplog', 'buftype', 'nofile')
		call setbufvar('tmplog', 'filetype', '')
	endif
	" let logjob = job_start(execute("!bash " . a:cmdline),
	if has('nvim')
		let logjob = jobstart(['bash', '-c', a:cmdline],
					\ {'out_io': 'buffer', 'out_name': 'tmplog', 'out_msg': ''})
	else
		let logjob = job_start(['bash', '-c', a:cmdline],
					\ {'out_io': 'buffer', 'err_io': 'buffer', 'out_name': 'tmplog', 'err_name': 'tmplog', 'out_msg': ''})
	endif
	let winnr = win_getid()
	vert sbuffer tmplog
	setlocal wrap
	wincmd L
	if win_getid() != winnr
		call win_gotoid(winnr)
	endif
endfunction

syntax enable

silent! colorscheme min

set secure
