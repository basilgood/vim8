scriptencoding utf-8

augroup vimRc
  autocmd!
augroup END

" startup time
if !v:vim_did_enter && has('reltime')
  let s:startuptime = reltime()
  au vimRc VimEnter * ++once let s:startuptime = reltime(s:startuptime) | redraw
        \ | echomsg 'startuptime: ' .. reltimestr(s:startuptime)
endif

packadd! matchit

nnoremap <space> <nop>
map <space> <leader>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-vinegar'
let g:netrw_fastbrowse = 0
let g:netrw_altfile = 1
let g:netrw_preview = 1
let g:netrw_altv = 1
let g:netrw_alto = 0
let g:netrw_use_errorwindow = 0
let g:netrw_localcopydircmd = 'cp -av'
autocmd vimRc FileType netrw nmap <buffer><silent> <right> <cr>
autocmd vimRc FileType netrw nmap <buffer><silent> <left> -

Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info --tac --ansi --margin 1,4'
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --color=always --exclude .git'
let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.95 } }
let g:fzf_preview_window = ['up:80%', 'ctrl-/']
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>

Plug 'dense-analysis/ale'
let g:ale_disable_lsp = 1
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_sign_info = '🛈 '
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
nmap <silent> [a <Plug>(ale_previous)
nmap <silent> ]a <Plug>(ale_next)
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'css': ['prettier'],
      \ 'json': ['prettier'],
      \ 'sh': ['shfmt'],
      \ 'nix': ['nixpkgs-fmt'],
      \}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-autoformat/vim-autoformat', {'on': 'Autoformat'}
let g:formatters_javascript = ['prettier', 'eslint_local']
let g:run_all_formatters_javascript = 1

Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'LnL7/vim-nix',{'for': 'nix'}
Plug 'cespare/vim-toml',{'for': 'toml'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'markonm/traces.vim'
let g:traces_num_range_preview = 1

Plug 'basilgood/memolist.vim', {'on': ['MemoList', 'MemoGrep', 'MemoNew']}
let g:memolist_memo_suffix = 'md'
let g:memolist_fzf = 1

Plug 'AndrewRadev/quickpeek.vim', {'for': 'qf'}
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

Plug 'voldikss/vim-floaterm'
let g:floaterm_height = 0.9
let g:floaterm_width = 0.9
let g:floaterm_autoclose = 2
let g:floaterm_keymap_toggle = '<C-q>'
tnoremap <c-x> <c-\><c-n>

Plug 'wellle/targets.vim'
let g:targets_nl = 'nN'

Plug 'svermeulen/vim-subversive'
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteRange)
xmap ss <plug>(SubversiveSubstituteRange)
nmap s. <plug>(SubversiveSubstituteWordRange)
nmap sc <plug>(SubversiveSubstituteRangeConfirm)
xmap sc <plug>(SubversiveSubstituteRangeConfirm)
nmap s, <plug>(SubversiveSubstituteWordRangeConfirm)

Plug 'junegunn/limelight.vim'
nmap X <Plug>(Limelight)
xmap X <Plug>(Limelight)

Plug 'markonm/hlyank.vim', {'commit': '39e52017'}
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'fcpg/vim-altscreen'
Plug 'whiteinge/diffconflicts'

Plug 'haya14busa/vim-asterisk'
let g:asterisk#keeppos = 1
map *  <Plug>(asterisk-z*)
map g* <Plug>(asterisk-gz*)
map #  <Plug>(asterisk-z#)
map g# <Plug>(asterisk-gz#)

Plug 'romainl/vim-cool'

call plug#end()

" completion
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-snippets'
      \ ]
let g:coc_user_config = {}
let g:coc_user_config['languageserver'] = {}
let g:coc_user_config['diagnostic.displayByAle'] = v:true
let g:coc_user_config['suggest.floatConfig.border'] = v:true
let g:coc_user_config['hover.floatConfig.border'] = v:true
let g:coc_user_config['signature.floatConfig.border'] = v:true
let g:coc_user_config['diagnostic.floatConfig.border'] = v:true
let g:coc_user_config['snippets.ultisnips.enable'] = v:false
let g:coc_user_config['snippets.userSnippetsDirectory'] = '~/.vim/snippets'
let g:coc_user_config['html-css-support.enabledLanguages'] = ['html', 'javascript']
let g:coc_user_config['git.addedSign.hlGroup'] = 'GitGutterAdd'
let g:coc_user_config['git.addedSign.text'] = '┃'
let g:coc_user_config['git.changeRemovedSign.hlGroup'] = 'GitGutterChangeDelete'
let g:coc_user_config['git.changeRemovedSign.text'] = '┃'
let g:coc_user_config['git.changedSign.hlGroup'] = 'GitGutterChange'
let g:coc_user_config['git.changedSign.text'] = '┃'
let g:coc_user_config['git.removedSign.hlGroup'] = 'GitGutterDelete'
let g:coc_user_config['git.removedSign.text'] = '┃'
let g:coc_user_config['git.topRemovedSign.hlGroup'] = 'GitGutterDelete'
let g:coc_user_config['git.topRemovedSign.text'] = '┃'

autocmd vimRc FileType javascript,typescript,nix,vim
      \ nmap <silent> gd <Plug>(coc-definition) |
      \ nmap <silent> gr <Plug>(coc-references) |
      \ nmap <leader>a :CocAction<cr> |
      \ nmap <leader>d :CocDiagnostics<cr> |
      \ nmap <silent> K :call CocActionAsync('doHover')<CR>

command! -nargs=0 Gstatus :CocList gstatus
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

nmap [h <Plug>(coc-git-prevchunk)
nmap ]h <Plug>(coc-git-nextchunk)
nmap ghp <Plug>(coc-git-chunkinfo)
nmap ghs :CocCommand git.chunkStage<cr>
nmap ghu :CocCommand git.chunkUnstage<cr>
nmap ghr :CocCommand git.chunkUndo<cr>
nnoremap <silent> <leader>g  :<C-u>CocList --normal gstatus<CR>

" options
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"
set t_ut=
set t_md=
set path=,,.,tests/**
set path+=lib/**,views/**,cz-components/**,test/**
set wildignore+=*/node_modules/*,*/.git/*,*/recordings/*,*/pack
set hidden
set gdefault
set autoread autowrite autowriteall
set noswapfile
set nowritebackup
set undofile undodir=/tmp/,.
set autoindent smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set nostartofline
set nojoinspaces
set nofoldenable
set nowrap
let &showbreak = '↳ '
set breakindent
set breakindentopt=sbr
set noshowmode
set nrformats-=octal
set number
set mouse=a ttymouse=sgr
set signcolumn=yes
set splitright splitbelow
set fillchars=stl:-,stlnc:-,vert:\│,fold:\ ,diff:-
set virtualedit=onemore
set sidescrolloff=10 sidescroll=1
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=help
set lazyredraw
set timeoutlen=1200
set ttimeoutlen=50
set updatetime=150
set incsearch hlsearch
set completeopt-=preview
set completeopt-=menu
set completeopt+=menuone,noselect,noinsert
set pumheight=10
set diffopt+=context:3,indent-heuristic,algorithm:patience
set list
set listchars=tab:⇀\ ,trail:•,nbsp:␣,extends:↦,precedes:↤
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•
set shortmess=
set shortmess+=asoOtIcF
set confirm
set history=1000
set viminfo^=!
set wildmenu
set wildoptions=pum,tagfile
set wildignorecase
set wildcharm=<C-Z>
set grepprg=grep\ -rnH\ --exclude=tags\ --exclude-dir=.git\ --exclude-dir=node_modules
let &grepformat = '%f:%l:%c:%m,%f:%l:%m'
let &errorformat ..= ',%f\|%\s%#%l col%\s%#%c%\s%#\| %m'
set backspace=indent,eol,start
set laststatus=2
" set statusline=%<%.99{expand('%:p:h:t')}/%t\ %*%h%w%m%r%=%{&filetype}%7c:%l/%L
set statusline=
set statusline+=%<%t
set statusline+=\ %{&mod?'🔺':'✔'}
set statusline+=\ %h%w%r
set statusline+=%=
set statusline+=\ %c:%l/%L
set statusline+=\ ---\ %{&ft}

" mappings
" wrap
noremap j gj
noremap k gk
"redline
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
" paragraph
nnoremap } }zz
nnoremap { {zz
" close qf
nnoremap <silent> <C-w>z :wincmd z<Bar>cclose<Bar>lclose<CR>
" objects
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>
nnoremap vv viw
" repeat on visual selection
vnoremap . :normal .<CR>
" c-g improved
nnoremap <silent> <C-g> :echon '['.expand("%:p:~").']'.' [L:'.line('$').']'<Bar>echon ' ['system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")']'<CR>
" reload syntax and nohl
nnoremap <silent> <C-l> :noh<bar>diffupdate<bar>call clearmatches()<bar>Limelight!<bar>syntax sync fromstart<cr><c-l>
" execute macro
nnoremap Q <Nop>
nnoremap Q @q
" run macro on selected lines
xnoremap Q :norm Q<cr>

" autocmds
" keep cursor position
autocmd vimRc BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" help keep widow full width
autocmd vimRc FileType qf wincmd J
autocmd vimRc BufWinEnter * if &ft == 'help' | wincmd J | end

" update diff / disable paste
autocmd vimRc InsertLeave * if &diff | diffupdate | endif
autocmd vimRc InsertLeave * if &paste | setlocal nopaste | echo 'nopaste' | endif

" external changes
autocmd vimRc FocusGained,CursorHold *
      \ if !bufexists("[Command Line]") |
      \ checktime |
      \ if exists('g:loaded_gitgutter') |
      \   call gitgutter#all(1) |
      \ endif

" mkdir
autocmd vimRc BufWritePre *
      \ if !isdirectory(expand('%:h', v:true)) |
      \   call mkdir(expand('%:h', v:true), 'p') |
      \ endif

" filetypes
let g:markdown_fenced_languages = ['vim', 'ruby', 'html', 'js=javascript', 'json', 'css', 'bash=sh', 'sh']
autocmd vimRc BufReadPre *.md,*.markdown setlocal conceallevel=2 concealcursor=n
autocmd vimRc FileType javascript setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd vimRc BufNewFile,BufRead *.gitignore setfiletype gitignore
autocmd vimRc BufNewFile,BufRead config      setfiletype config
autocmd vimRc BufNewFile,BufRead *.lock      setfiletype config
autocmd vimRc BufNewFile,BufRead .babelrc    setfiletype json
autocmd vimRc BufNewFile,BufRead *.txt       setfiletype markdown
autocmd vimRc BufReadPre *.json  setlocal conceallevel=0 concealcursor=
autocmd vimRc BufReadPre *.json  setlocal formatoptions=
autocmd vimRc FileType git       setlocal nofoldenable
autocmd vimRc FileType scss setlocal iskeyword+=@-@

" commands
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! -nargs=0 WT %s/[^\t]\zs\t\+/ / | normal! ``
command! -nargs=0 CW Lines<c-r><c-w>
command! WW w !sudo tee % > /dev/null
command! -bar HL echo
      \ synIDattr(synID(line('.'),col('.'),0),'name')
      \ synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')

" sessions
let g:session_path = expand('~/.cache/vim/sessions')
if !isdirectory(g:session_path)
  call mkdir(g:session_path, 'p')
endif
autocmd! vimRc VimLeavePre * execute 'mksession! '.g:session_path.'/'split(getcwd(), '/')[-1] . '.vim'
command! -nargs=0 SS :execute 'source ' .g:session_path.'/'split(getcwd(), '/')[-1] . '.vim'
nnoremap <F2> :SS<cr>

" grep
function! s:grep(word) abort
  let cmd = printf('rg --vimgrep --no-heading %s', a:word)
  cgetexpr system(cmd) | cw
endfunction
command! -nargs=1 -complete=file Grep call <SID>grep(<q-args>)

syntax enable
set termguicolors
set background=dark
colorscheme oceanicnext

set secure
