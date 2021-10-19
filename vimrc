" vint: -ProhibitSetNoCompatible
if &compatible
  set nocompatible
endif

if &encoding !=? 'utf-8'
  let &termencoding = &encoding
  setglobal encoding=utf-8
endif
scriptencoding utf-8

let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1
let g:sh_noisk = 1

augroup vimRc
  autocmd!
augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs'
        \ 'https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" navigation
let g:netrw_list_hide= '^\.\.\=/\=$'
let g:netrw_banner = 0
let g:netrw_fastbrowse = 0
let g:netrw_altfile = 1
let g:netrw_preview = 1
let g:netrw_altv = 1
let g:netrw_alto = 0
let g:netrw_use_errorwindow = 0
let g:netrw_localcopydircmd = 'cp -av'
function! s:opentree()
  let fname = expand('%:t')
  edit %:p:h
  norm! gg
  call search('\<'.fname.'\>')
endfunction
nnoremap - :<C-U>call <SID>opentree()<CR>
autocmd vimRc FileType netrw nmap <buffer><silent> <right> <cr>
autocmd vimRc FileType netrw nmap <buffer><silent> <left> -
autocmd vimRc FileType netrw nmap <buffer> <c-x> mfmx
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude plugged'
let $FZF_PREVIEW_COMMAND = 'bat --color=always --style=plain -n -- {} || cat {}'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <c-p> :Files<cr>
nnoremap <c-\> :Files %:h<cr>
nnoremap <bs> :Buffers<cr>

" lint
Plug 'dense-analysis/ale'
let g:ale_disable_lsp = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
nmap <silent> [a <Plug>(ale_previous)
nmap <silent> ]a <Plug>(ale_next)
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none --arrow-parens avoid --print-width 140'
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['prettier', 'eslint'],
      \   'typescript': ['prettier', 'eslint'],
      \   'css': ['stylelint'],
      \   'json': ['fixjson'],
      \   'sh': ['shfmt'],
      \   'nix': ['nixpkgs-fmt'],
      \ }

" complete + lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions =[]
let g:coc_user_config = {}
let g:coc_user_config = {'diagnostic.displayByAle': v:true, 'suggest.minTriggerInputLength': 2, 'suggest.triggerCompletionWait': 250}
let g:coc_user_config['languageserver'] = {}
let g:coc_user_config['languageserver']['typescript-language-server'] = {
      \'command': 'typescript-language-server',
      \'args': ['--stdio'],
      \'rootPatterns': ['.git/', 'package.json'],
      \'filetypes': ['javascript', 'typescript', 'javascriptreact', 'typescriptreact']
      \}
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
function! s:coc_mappings()
  nmap <silent> <expr> K &filetype == 'vim' ? ":execute 'h '.expand('<cword>')<cr>" : ":call CocActionAsync('doHover')<cr>"
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> ]e <Plug>(coc-diagnostic-next)
  nmap <silent> [e <Plug>(coc-diagnostic-prev)
  command! -nargs=0 Format :call CocAction('format')
endfunction
autocmd vimRc FileType javascript,javascriptreact,typescript,typescriptreact silent! call <SID>coc_mappings()

" lang
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'yuezk/vim-js', { 'for': 'javascript' }
Plug 'LnL7/vim-nix', { 'for': 'nix' }

" edit
Plug 'editorconfig/editorconfig-vim'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

" git
Plug 'tpope/vim-fugitive'
nnoremap <leader>g :G <bar> Goyo<cr>
Plug 'airblade/vim-gitgutter'
let g:gitgutter_grep = 'rg'
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added    = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed  = '▎'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed        = '▌'
let g:gitgutter_sign_removed_above_and_below = '▎'
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
Plug 'gotchane/vim-git-commit-prefix'
Plug 'whiteinge/diffconflicts'
Plug 'hotwatermorning/auto-git-diff'
Plug 'tpope/vim-rhubarb'

"misc
Plug 'pgdouyon/vim-evanesco'
Plug 'tpope/vim-repeat'
Plug 'markonm/traces.vim'
Plug 'AndrewRadev/quickpeek.vim', { 'for': 'qf' }
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>
Plug 'fcpg/vim-altscreen'
Plug 'markonm/hlyank.vim', { 'commit': '39e52017' }
Plug 'basilgood/vim-system-copy'
Plug 'vim-scripts/cmdline-completion'
Plug 'mbbill/undotree'
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
Plug 'junegunn/goyo.vim'
let g:goyo_width = 300
nnoremap <expr> <leader><leader> winnr("$") == 1 ? ":Goyo<cr>:wincmd w<cr>" : ":Goyo<cr>"
Plug 'michaeljsmith/vim-indent-object'
Plug 'haya14busa/vim-edgemotion'
map <C-j> <Plug>(edgemotion-j)
map <C-k> <Plug>(edgemotion-k)

" theme
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'duhduhdan/vim-nordan'
call plug#end()

packadd! matchit
packadd! cfilter

" options
set term=xterm-256color
set t_Co=256
set t_ut=
set t_md=

let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"

set path=.,**
set wildignore+=
      \*/node_modules/*,
      \*/.git/*,
      \*/recordings/*,
      \*/pack
set autoread autowrite autowriteall
set noswapfile
set nowritebackup
set undofile undodir=/tmp//,.
set nostartofline
set nojoinspaces
set nofoldenable
set nowrap
set breakindent breakindentopt=shift:4,sbr
set noshowmode
set nrformats-=octal
set number
set mouse=a ttymouse=sgr
set splitright splitbelow
set virtualedit=onemore
set scrolloff=0 sidescrolloff=10 sidescroll=1
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=help
set lazyredraw
set ttimeout timeoutlen=2000 ttimeoutlen=50
set updatetime=50
set incsearch hlsearch
set gdefault
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert
setg omnifunc=syntaxcomplete#Complete
setg completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10
set diffopt+=context:3,indent-heuristic,algorithm:patience
set list
set listchars=tab:⇥\ ,trail:•,nbsp:␣,extends:↦,precedes:↤
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•
set confirm
set shortmess+=sIcaF
set shortmess-=S
set autoindent smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set history=1000
set viminfo^=!
set wildmenu
set wildmode=list,full
set wildignorecase
set wildcharm=<C-Z>
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading gfm=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --column
else
  set grepprg=grep\ -rnH\ --exclude=tags\ --exclude-dir=.git\ --exclude-dir=node_modules
endif
set grepformat^=%f:%l:%c:%m
set backspace=indent,eol,start
set laststatus=2
set statusline=%<%.99f\ %y%h%w%m%r%=%-14.(%l,%c%V%)\ %L


" mappings
map OA <Up>
map OB <Down>
map OC <Right>
map OD <Left>
" wrap
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
"redline
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
" paragraph
nnoremap } }zz
nnoremap { {zz
" relativenumber
nnoremap <silent> <expr> <leader>n &relativenumber ? ':windo set norelativenumber<cr>' : ':windo set relativenumber<cr>'
" close qf
nnoremap <silent> <C-w>z :wincmd z<Bar>cclose<Bar>lclose<CR>
" objects
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>
" Paste continuously.
nnoremap ]p viw"0p
vnoremap ]p "0p
" substitute
nmap sn *cgn
" c-g improved
nnoremap <silent> <C-g> :echon '['.expand("%:p:~").']'.' [L:'.line('$').']'<Bar>echon ' ['system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")']'<CR>
" reload syntax and nohl
nnoremap <silent> <C-l> :noh<bar>diffupdate<bar>call clearmatches()<bar>syntax sync fromstart<cr><c-l>
" execute macro
nnoremap Q <Nop>
nnoremap Q @q
" run macro on selected lines
vnoremap Q :norm Q<cr>
" jump to window no
for i in range(1, 9)
  execute 'nnoremap <silent> <space>'.i.' :'.i.'wincmd w<cr>'
endfor
nnoremap <silent> <space>c :wincmd c<cr>
" jumping
function! Listjump(list_type, direction, wrap) abort
  try
    exe a:list_type . a:direction
  catch /E553/
    exe a:list_type . a:wrap
  catch /E42/
    return
  catch /E163/
    return
  endtry
  normal! zz
endfunction
nnoremap <silent> ]q :call Listjump("c", "next", "first")<CR>
nnoremap <silent> [q :call Listjump("c", "previous", "last")<CR>
nnoremap <silent> ]l :call Listjump("l", "next", "first")<CR>
nnoremap <silent> [l :call Listjump("l", "previous", "last")<CR>

" range commands
cnoremap <c-x>t <CR>:t''<CR>
cnoremap <c-x>m <CR>:m''<CR>
cnoremap <c-x>d <CR>:d<CR>``

" autocmds
" keep cursor position
autocmd vimRc BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

" format
autocmd vimRc FileType nix setlocal makeprg=nix-instantiate\ --parse
autocmd vimRc FileType nix setlocal formatprg=nixpkgs-fmt
autocmd vimRc BufRead,BufNewFile *.nix command! FM silent call system('nixpkgs-fmt ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx command! FM silent call system('prettier --single-quote --trailing-comma none --write ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx command! Fix silent call system('eslint --fix ' . expand('%'))
autocmd vimRc FileType yaml command! FM silent call system('prettier --write ' . expand('%'))
autocmd vimRc FileType sh command! FM silent call system('shfmt -i 2 -ci -w ' . expand('%'))

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
let g:markdown_fenced_languages = ['vim', 'ruby', 'html', 'javascript', 'css', 'bash=sh', 'sh']
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

" commands
command! -nargs=0 BO silent! execute "%bd|e#|bd#"
command BD bp | bd #
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! -nargs=0 WT %s/[^\t]\zs\t\+/ / | normal! ``
command! WW w !sudo tee % > /dev/null
command! -bar HL echo
      \ synIDattr(synID(line('.'),col('.'),0),'name')
      \ synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')
command! -bang -nargs=* -complete=file Make
      \ call asyncdo#run(1, &makeprg, <f-args>)
command! -bang -nargs=* -complete=file LMake
      \ call asyncdo#lrun(1, &makeprg, <f-args>)
command! -bang -nargs=+ -complete=file Grep
      \ call asyncdo#run(1, {'job': &grepprg, 'errorformat': &grepformat}, <f-args>) |
      \ let @/=split("<args>")[0] |
      \ call feedkeys(":let &hlsearch=1\<CR>", "n") |
      \ copen |
      \ redraw!
cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
command! -nargs=1 TV
      \ call system('tmux split-window -h '.<q-args>)
command! TA TV tig --all
command! TS TV tig status

" sessions
if empty(glob('~/.cache/vim/sessions')) > 0
  call mkdir(expand('~/.cache/vim/sessions'), 'p')
end
autocmd! vimRc VimLeavePre * execute "mksession! ~/.cache/vim/sessions/" . split(getcwd(), "/")[-1] . ".vim"
command! -nargs=0 SS :execute 'source ~/.cache/vim/sessions/' .  split(getcwd(), '/')[-1] . '.vim'

"functions
" terminal
let g:term_buf = 0
let g:term_win = 0
function! Termtoggle()
  if win_gotoid(g:term_win)
    hide
  else
    tabe
    try
      exec 'buffer ' . g:term_buf
    catch
      exec ':term ++curwin'
      let g:term_buf = bufnr('')
      setlocal nonumber norelativenumber
      setlocal signcolumn=no
      setlocal nobuflisted bufhidden=hide
    endtry
    if mode() !=# 'i' && mode() !=# 't'
      call feedkeys('i')
    endif
    let g:term_win = win_getid()
  endif
endfunction
tnoremap <c-q> <c-w>N
nnoremap <c-\> :call Termtoggle()<cr>
tnoremap <c-\> <c-w>N:call Termtoggle()<cr>

syntax enable

set termguicolors
colorscheme nordan
hi Search cterm=reverse guifg=#1c1c1c
hi ALEErrorSign guifg=#c64552 guibg=NONE
hi ALEWarningSign guifg=#c6be45 guibg=NONE

set secure
