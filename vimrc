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

" " minpac
if has('vim_starting')
  if empty(glob('~/.vim/pack/minpac/opt/minpac'))
    echo 'Install minpac ...'
    execute 'silent! !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac'
  endif
  if empty(glob('~/.vim/autoload'))
    echo 'Install plugpac ...'
    execute 'silent !wget -nc -q github.com/bennyyip/plugpac.vim/raw/master/plugpac.vim -P ~/.vim/autoload/'
  endif
endif

call plugpac#begin()

Pack 'k-takata/minpac', {'type': 'opt'}
Pack 'tpope/vim-vinegar', {'type': 'opt'}
Pack 'junegunn/fzf'
Pack 'junegunn/fzf.vim', {'type': 'opt'}
Pack 'liyechen/vim-agriculture', {'type': 'opt'}
Pack 'dense-analysis/ale', {'type': 'opt'}
Pack 'neoclide/coc.nvim', {'branch': 'release'}
Pack 'yaegassy/coc-jsdoc', {'do': {-> system('yarn install --frozen-lockfile')}}
Pack 'vim-autoformat/vim-autoformat', {'on': 'Autoformat'}
Pack 'maxmellon/vim-jsx-pretty'
Pack 'yuezk/vim-js'
Pack 'LnL7/vim-nix'
Pack 'cespare/vim-toml'
Pack 'editorconfig/editorconfig-vim', {'type': 'opt'}
Pack 'tpope/vim-commentary', {'type': 'opt'}
Pack 'tpope/vim-surround', {'type': 'opt'}
Pack 'tpope/vim-repeat', {'type': 'opt'}
Pack 'markonm/traces.vim', {'type': 'opt'}
Pack 'wellle/targets.vim', {'type': 'opt'}
Pack 'haya14busa/vim-asterisk'
Pack 'stefandtw/quickfix-reflector.vim'
Pack 'mbbill/undotree', {'on': 'UndotreeToggle'}
Pack 'basilgood/memolist.vim', {'on': ['MemoList', 'MemoNew']}
Pack 'markonm/hlyank.vim', { 'rev': '39e52017', 'type': 'opt' }
Pack 'AndrewRadev/quickpeek.vim', {'type': 'opt'}
Pack 'romainl/vim-cool', {'type': 'opt'}
Pack 'voldikss/vim-floaterm', {'type': 'opt'}
Pack 'fcpg/vim-altscreen'
Pack 'tpope/vim-fugitive', {'type': 'opt'}
Pack 'whiteinge/diffconflicts', {'on': 'DiffConflicts'}
Pack 'tpope/vim-rhubarb'

call plugpac#end()

" vinegar
let g:netrw_fastbrowse = 0
let g:netrw_altfile = 1
let g:netrw_preview = 1
let g:netrw_altv = 1
let g:netrw_alto = 0
let g:netrw_use_errorwindow = 0
let g:netrw_localcopydircmd = 'cp -av'
autocmd vimRc FileType netrw nmap <buffer><silent> <right> <cr>
autocmd vimRc FileType netrw nmap <buffer><silent> <left> -
autocmd vimRc VimEnter * ++once packadd vim-vinegar

" fzf
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info --tac --ansi --margin 1,4'
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --color=always --exclude .git'
let g:fzf_layout = { 'window': { 'width': 0.85, 'height': 0.95 } }
let g:fzf_preview_window = ['up:80%', 'ctrl-/']
autocmd vimRc VimEnter * ++once packadd fzf.vim
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>

" agriculture
autocmd vimRc CmdlineEnter * ++once packadd vim-agriculture
nmap <leader>/ <Plug>RgRawSearch
vmap <leader>/ <Plug>RgRawVisualSelection
nmap <leader>* <Plug>RgRawWordUnderCursor

" completion
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-html-css-support',
      \ 'coc-yaml',
      \ 'coc-vimlsp'
      \ ]
let g:coc_user_config = {}
let g:coc_user_config['languageserver'] = {}
let g:coc_user_config['diagnostic.displayByAle'] = v:true
let g:coc_user_config['suggest.floatConfig.border'] = v:true
let g:coc_user_config['hover.floatConfig.border'] = v:true
let g:coc_user_config['signature.floatConfig.border'] = v:true
let g:coc_user_config['diagnostic.floatConfig.border'] = v:true
let g:coc_user_config['html-css-support.enabledLanguages'] = ['html', 'javascript']

autocmd vimRc FileType javascript,typescript,nix,vim
      \ nmap <silent> gd <Plug>(coc-definition) |
      \ nmap <silent> gr <Plug>(coc-references) |
      \ nmap <leader>a :CocAction<cr> |
      \ nmap <leader>d :CocDiagnostics<cr> |
      \ nmap <silent> K :call CocActionAsync('doHover')<CR>

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
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

" lint
autocmd vimRc BufRead * ++once packadd ale
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

" editorconfig
packadd! editorconfig-vim

" traces
autocmd vimRc CmdlineEnter * ++once packadd traces.vim
let g:traces_num_range_preview = 1

" asterisk
nmap *  <Plug>(asterisk-z*)
vmap *  <Plug>(asterisk-z*)

" memolist
let g:memolist_memo_suffix = 'md'
let g:memolist_fzf = 1

" undotree
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

" quickpeek
packadd! quickpeek.vim
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

" floaterm
autocmd vimRc BufRead * ++once packadd vim-floaterm
let g:floaterm_autoclose = 2
let g:floaterm_keymap_toggle = '<C-q>'
tnoremap <c-x> <c-\><c-n>

" targets
autocmd vimRc BufRead * ++once packadd targets.vim
let g:targets_nl = 'nN'

" fugitive
autocmd vimRc CmdlineEnter * ++once packadd vim-fugitive
autocmd vimRc Filetype fugitive
      \ nmap <buffer> p :G push<cr> |
      \ nmap <buffer> P :G push -f<cr>


" plugins
packadd! editorconfig-vim
autocmd vimRc BufRead * ++once packadd vim-commentary
autocmd vimRc BufRead * ++once packadd vim-surround
autocmd vimRc BufRead * ++once packadd vim-repeat
autocmd vimRc BufRead * ++once packadd traces.vim
autocmd vimRc BufRead * ++once packadd hlyank.vim
autocmd vimRc BufRead * ++once packadd vim-cool

filetype plugin indent on

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
set fillchars=vert:\│,fold:-
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
set listchars=tab:↦\ ,trail:•,nbsp:␣,extends:↦,precedes:↤
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
set statusline=%<%.99{expand('%:p:h:t')}/%t\ %*%h%w%m%r%=%{&filetype}%7c:%l/%L

" mappings
" save
nnoremap <leader><leader> :update<cr>
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
" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>
" substitute
nmap <leader>w *cgn
xnoremap s :s/
" c-g improved
nnoremap <silent> <C-g> :echon '['.expand("%:p:~").']'.' [L:'.line('$').']'<Bar>echon ' ['system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")']'<CR>
" reload syntax and nohl
nnoremap <silent> <C-l> :noh<bar>diffupdate<bar>call clearmatches()<bar>syntax sync fromstart<cr><c-l>
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

" window split
function! WinMove(key)
  let t:curwin = winnr()
  exec 'wincmd '.a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec 'wincmd '.a:key
  endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" substitute
function! Substitute(type, ...)
  let cur = getpos("''")
  call cursor(cur[1], cur[2])
  let cword = expand('<cword>')
  execute "'[,']s/" . cword . '/' . input(cword . '/')
  call cursor(cur[1], cur[2])
endfunction
nmap <silent> s m':set opfunc=Substitute<CR>g@

syntax enable
set termguicolors
set background=dark
colorscheme OceanicNext

set secure
