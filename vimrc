unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

scriptencoding utf-8

augroup vimRc
  autocmd!
augroup END

if has('vim_starting')
  let s:dein_dir = expand('~/.cache/dein')
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
      execute '!git clone git@github.com:Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
  endif
endif

let g:dein#auto_recache = 1
let g:dein#install_progress_type = 'echo'
let g:dein#install_log_filename = expand('')
let g:dein#types#git#default_protocol = 'ssh'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('natebosch/vim-lsc', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPre','BufNewFile']
        \ })
  call dein#add('maralla/completor.vim', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPre','BufNewFile']
        \ })
  call dein#add('junegunn/fzf', {
        \ 'merged': 0,
        \ 'on_event': 'CmdlineEnter'
        \ })
  call dein#add('junegunn/fzf.vim', {
        \ 'depends': 'fzf',
        \ 'on_cmd': ['Files', 'Buffers'],
        \ 'hook_add': join([
        \ 'let $FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --exclude plugged"',
        \ 'let g:fzf_layout = { "down": "~15%" }',
        \ 'nnoremap <c-p> :Files<cr>',
        \ 'nnoremap <c-;> :Files %:h<cr>',
        \ 'nnoremap <bs> :Buffers<cr>'], "\n")
        \ })
  call dein#add('dense-analysis/ale', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPost','BufNewFile'],
        \ 'hook_source': join([
        \ 'nmap <silent> [a <Plug>(ale_previous_wrap)',
        \ 'nmap <silent> ]a <Plug>(ale_next_wrap)',
        \ 'let g:ale_sign_error = "✘"',
        \ 'let g:ale_sign_warning = "➤"',
        \ 'let g:ale_sign_info = "➟"',
        \ 'let g:ale_set_highlights = 0',
        \ 'let g:ale_lint_on_text_changed = "normal"',
        \ 'let g:ale_lint_on_insert_leave = 1',
        \ 'let g:ale_lint_delay = 0',
        \ 'let g:ale_echo_msg_format = "%s"',
        \ 'let g:ale_pattern_options = {
        \   "\.min\.js$": {"ale_linters": [], "ale_fixers": []},
        \   "\.min\.css$": {"ale_linters": [], "ale_fixers": []},
        \ }',
        \ 'let g:ale_fixers = {
        \   "jsx": ["eslint"],
        \   "javascript": ["eslint"],
        \   "typescript": ["eslint"],
        \   "nix": ["nixpkgs-fmt"]
        \ }',
        \ 'let g:ale_linters = {
        \   "jsx": ["eslint"],
        \   "javascript": ["eslint"],
        \   "typescript": ["eslint"]
        \  }'], "\n")
        \ })
  call dein#add('tpope/vim-fugitive', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPre','BufNewFile'],
        \ 'on_cmd': ['Gstatus','Gvdiffsplit'],
        \ 'hook_source': join([
        \ 'nnoremap [git]  <Nop>',
        \ 'nmap <space>g [git]',
        \ 'nnoremap <silent> [git]s :<C-u>vertical Gstatus<cr>',
        \ 'nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<cr>gg'], "\n")
        \ })
  call dein#add('idanarye/vim-merginal', {
        \ 'lazy' : 1,
        \ 'on_cmd': ['MerginalToggle']
        \ })
  call dein#add('editorconfig/editorconfig-vim', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPost','BufNewFile'],
        \ 'hook_add': 'let g:EditorConfig_exclude_patterns = ["fugitive://.*"]'
        \ })
  call dein#add('airblade/vim-gitgutter', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPost','BufNewFile'],
        \ 'hook_source': join([
        \ 'let g:gitgutter_sign_priority = 8',
        \ 'let g:gitgutter_override_sign_column_highlight = 0',
        \ 'nmap ghs <Plug>(GitGutterStageHunk)',
        \ 'nmap ghu <Plug>(GitGutterUndoHunk)',
        \ 'nmap ghp <Plug>(GitGutterPreviewHunk)'], "\n")
        \ })
  call dein#add('mbbill/undotree', {
        \ 'lazy' : 1,
        \ 'on_cmd': ['UndotreeToggle'],
        \ 'hook_add': join([
        \ 'let g:undotree_WindowLayout = 4',
        \ 'let g:undotree_SetFocusWhenToggle = 1',
        \ 'let g:undotree_ShortIndicators = 1'], "\n")
        \ })
  call dein#add('tpope/vim-surround', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPost','BufNewFile']
        \ })
  call dein#add('tpope/vim-repeat', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPost','BufNewFile'],
        \ 'hook_add': 'vnoremap . :normal .<CR>'
        \ })
  call dein#add('tomtom/tcomment_vim', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPost','BufNewFile']
        \ })
  call dein#add('haya14busa/vim-asterisk', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPost','BufNewFile'],
        \ 'hook_source': join([
        \ 'let g:asterisk#keeppos = 1',
        \ 'map *  <Plug>(asterisk-z*)',
        \ 'map #  <Plug>(asterisk-z#)',
        \ 'map g* <Plug>(asterisk-gz*)',
        \ 'map g# <Plug>(asterisk-gz#)'], "\n")
        \ })
  call dein#add('fcpg/vim-altscreen', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufWinEnter']
        \ })
  call dein#add('stefandtw/quickfix-reflector.vim', {
        \ 'lazy' : 1,
        \ 'on_ft': 'qf'
        \ })
  call dein#add('wellle/targets.vim', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPre','BufNewFile']
        \ })
  call dein#add('markonm/hlyank.vim', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPre','BufNewFile']
        \ })
  call dein#add('hauleth/asyncdo.vim')
  call dein#add('igemnace/vim-sniplet', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPre','BufNewFile'],
        \ 'hook_add': 'imap <c-q> <Plug>SnipletExpand'
        \ })
  call dein#add('hotwatermorning/auto-git-diff', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPre','BufNewFile']
        \ })
  call dein#add('whiteinge/diffconflicts', {
        \ 'lazy' : 1,
        \ 'on_cmd': 'DiffConflicts'
        \ })
  call dein#add('junegunn/vim-peekaboo', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPre','BufNewFile']
        \ })
  call dein#add('markonm/traces.vim', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPre','BufNewFile']
        \ })
  call dein#add('vim-scripts/cmdline-completion', {
        \ 'lazy' : 1,
        \ 'on_event': ['CmdlineEnter']
        \ })
  call dein#add('romainl/vim-cool', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPre','BufNewFile'],
        \ 'hook_add': 'let g:CoolTotalMatches = 1'
        \ })
  call dein#add('sheerun/vim-polyglot', {
        \ 'lazy' : 1,
        \ 'on_event': ['BufReadPost','BufNewFile']
        \ })
  call dein#add('basilgood/min.vim')

  call dein#end()
  call dein#save_state()
endif

if !has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" NETRW
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
nmap <silent> - :call Opendir('edit')<CR>
function! Opendir(cmd) abort
  if expand('%') =~# '^$\|^term:[\/][\/]'
    execute a:cmd '.'
  else
    execute a:cmd '%:h'
    let pattern = '^\%(| \)*'.escape(expand('#:t'), '.*[]~\').'[/*|@=]\=\%($\|\t\)'
    call search(pattern, 'wc')
  endif
endfunction

" COMPLETOR
if dein#tap('completor.vim')
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
  let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
  let g:completor_scss_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
endif

" LSC
if dein#tap('vim-lsc')
  let g:lsc_server_commands = {
        \ 'javascript': {
        \   'command': 'typescript-language-server --stdio',
        \   'log_level': -1,
        \   'suppress_stderr': v:true
        \ },
        \ 'typescript': {
        \   'command': 'typescript-language-server --stdio',
        \   'log_level': -1,
        \   'suppress_stderr': v:true
        \ }
        \}
  let g:lsc_auto_map = {
        \ "GoToDefinition": "gd",
        \ "FindReferences": "gr",
        \ "ShowHover": "K",
        \ "FindCodeActions": "ga"
        \ }
  let g:lsc_enable_autocomplete  = v:true
  let g:lsc_enable_diagnostics   = v:false
  let g:lsc_reference_highlights = v:false
  let g:lsc_trace_level          = 'off'
endif

" PERSONAL OPTIONS
if exists('$TMUX')
  set term=xterm-256color
endif
set t_Co=256
set t_ut=
set t_md=

let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"

set autoread autowrite
set noswapfile nobackup
set undofile undodir=/tmp,.
set noerrorbells visualbell t_vb=
set path& | let &path .= '**'
set nostartofline
set nowrap
set virtualedit=onemore
set scrolloff=0 sidescrolloff=10 sidescroll=1
set incsearch hlsearch
set regexpengine=1
set gdefault
set switchbuf+=useopen,usetab
set splitright splitbelow
set signcolumn=yes
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10
set diffopt+=vertical,context:3,indent-heuristic,algorithm:patience
set nrformats-=octal
set mouse=a ttymouse=sgr
set lazyredraw ttyfast
set backspace=indent,eol,start
set wildmenu
set list
set listchars=tab:›\ ,trail:•,extends:»,precedes:«,nbsp:⣿
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•
set confirm
set shortmess+=IOFc
set autoindent copyindent preserveindent smartindent
set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
set helplang=en spelllang=en_us
set history=200
set wildmode=longest:list,full
set wildignorecase
set wildignore=
      \*/node_modules/*,
      \*/.git/*
set wildcharm=<C-Z>
set ttimeout timeoutlen=1000 ttimeoutlen=0
set updatetime=50
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
endif
set grepformat^=%f:%l:%c:%m
set laststatus=2
set statusline=%<%f\ %h%#error#%m%*%r%=%-14.(%l\:%c%)%{&filetype}

" MAPPINGS
nnoremap <leader><leader> :update<cr>
nnoremap <s-tab> <c-w>w
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
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
" OBJECTS
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>
" COPY / paste
vnoremap <expr>y "my\"" . v:register . "y`y"
nmap  <Space>   [Space]
vmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap <silent> [Space]y y:call system("wl-copy", @")<cr>
nnoremap [Space]p :let @"=substitute(system("wl-paste -n"), '<C-v><C-m>', '', 'g')<cr>:put<cr>
nnoremap [Space]w diw:let @"=substitute(system("wl-paste -n"), '<C-v><C-m>', '', 'g')<cr>P
xnoremap [Space]p d:let @"=substitute(system("wl-paste -n"), '<C-v><C-m>', '', 'g')<cr>P
vnoremap P "0p
" SUBSTITUTE
nnoremap ss :%s/
nnoremap sl :s/
xnoremap s  :s/
nnoremap sa :<c-u>%s/\C\<<c-r><c-w>\>/<c-r><c-w>
nnoremap sw :<C-u>%s/\C\<<C-R><C-w>\>//g<Left><Left>
" SEARCH AND REPLACE
nnoremap sn :<C-U>let @/='\<'.expand("<cword>").'\>'<CR>:set hlsearch<CR>cgn
" DIFF TWO BUFFERS
nnoremap <silent> <expr> [Space]dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"
" C-G IMPROVED
nnoremap <silent> <C-g> :file<Bar>echon ' ' system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")<CR>
" RELOAD SYNTAX AND NOHL
nnoremap <silent><expr> <C-l> empty(get(b:, 'current_syntax'))
      \ ? "\<C-l>"
      \ : "\<C-l>:syntax sync fromstart\<cr>:nohlsearch<cr>"
" EXECUTE MACRO
nnoremap Q <Nop>
nnoremap Q @q
" RUN MACRO ON SELECTED LINES
vnoremap Q :norm Q<cr>
" FIND
nnoremap [Space]f :find *<c-z>

" OMNICOMPLETE
autocmd vimRc Filetype *
      \ if &omnifunc == "" |
      \   setlocal omnifunc=syntaxcomplete#Complete |
      \ endif

" FORMAT
autocmd vimRc FileType nix setlocal makeprg=nix-instantiate\ --parse
autocmd vimRc FileType nix setlocal formatprg=nixpkgs-fmt
autocmd vimRc BufRead,BufNewFile *.nix command! F silent call system('nixpkgs-fmt ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx command! F silent call system('prettier --single-quote --write ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx command! Fix silent call system('eslint --fix ' . expand('%'))
autocmd vimRc FileType yaml command! F silent call system('prettier --write ' . expand('%'))
autocmd vimRc FileType sh command! F silent call system('shfmt -i 2 -ci -w ' . expand('%'))

" LARGE FILES
let g:large_file = 20*1024*1024 " 20MB
autocmd vimRc BufReadPre *
      \ let f=expand("<afile>") |
      \ if getfsize(f) > g:large_file |
      \ set eventignore+=FileType |
      \ setlocal noswapfile bufhidden=unload undolevels=-1 |
      \ else |
      \ set eventignore-=FileType |
      \ endif

" HELP KEEP WIDOW FULL WIDTH
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end

" UPDATE DIFF
autocmd vimRc InsertLeave * if &l:diff | diffupdate | endif

" DETECT FILETYPE ON SAVE
autocmd vimRc BufWritePost * if &filetype ==# '' | filetype detect | endif

" EXTERNAL CHANGES
autocmd vimRc FocusGained,CursorHold *
      \ if !bufexists("[Command Line]") |
      \ checktime |
      \ if exists('g:loaded_gitgutter') |
      \   call gitgutter#all(1) |
      \ endif

" AUTOMATICALLY SET EXPANDTAb
autocmd vimRc FileType * execute 'setlocal ' . (search('^\t.*\n\t.*\n\t', 'n') ? 'no' : '') . 'expandtab'

" SET NONUMBER IN TERMINAL Window
autocmd vimRc BufWinEnter * if &l:buftype == 'terminal' | setlocal nonumber | endif

" MKDIR
autocmd vimRc BufWritePre *
      \ if !isdirectory(expand('%:h', v:true)) |
      \   call mkdir(expand('%:h', v:true), 'p') |
      \ endif

" FILETYPES
autocmd vimRc FileType javascript setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd vimRc BufNewFile,BufRead *.gitignore setfiletype gitignore
autocmd vimRc BufNewFile,BufRead *.twig      setfiletype twig.html
autocmd vimRc BufNewFile,BufRead config      setfiletype config
autocmd vimRc BufNewFile,BufRead *.lock      setfiletype config
autocmd vimRc BufNewFile,BufRead .babelrc    setfiletype json
autocmd vimRc BufNewFile,BufRead *.txt       setfiletype markdown
autocmd vimRc BufWinEnter *.json setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json  setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json  setlocal formatoptions=
autocmd vimRc FileType git       setlocal nofoldenable

" COMMANDS
command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command BD bp | bd #
command! -nargs=0 WS %s/\s\+$// | normal! ``
function! Hlgroup() abort
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction
command! HL call Hlgroup()
command! -nargs=1 TV
      \ call system('tmux split-window -h '.<q-args>)
command! TA TV tig --all
command! TS TV tig status
command! -bang -nargs=* -complete=file Make
      \ call asyncdo#run(1, &makeprg, <f-args>)
command! -bang -nargs=* -complete=file LMake
      \ call asyncdo#lrun(1, &makeprg, <f-args>)
command! -bang -nargs=+ -complete=file Grep
      \ call asyncdo#run(1, {'job': &grepprg, 'errorformat': &grepformat}, <f-args>)

" FUNCTIONS
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

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --hidden --smart-case -g "!.git" %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

if has('vim_starting')
  syntax enable
endif

silent! colorscheme min
if !has('vim_starting')
  call dein#call_hook('source')
endif

set secure
