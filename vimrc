" vint: -ProhibitSetNoCompatible
if &compatible
  set nocompatible
endif

if &encoding !=? 'utf-8'
  let &termencoding = &encoding
  setglobal encoding=utf-8
endif
scriptencoding utf-8

let loaded_netrwPlugin = 1
let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1
let g:sh_noisk = 1

augroup vimRc
  autocmd!
augroup END

if empty(glob('~/.vim/autoload/plug.vim'))
  execute '!curl -fLo ~/.vim/autoload/plug.vim'
        \ 'https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" navigation
Plug 'cocopon/vaffle.vim', { 'on':  'Vaffle' }
let g:vaffle_force_delete = 1
let g:vaffle_show_hidden_files = 1
autocmd vimRc FileType vaffle nmap <buffer><silent> <right> l
autocmd vimRc FileType vaffle nmap <buffer><silent> <left> h
nnoremap <silent><expr> - bufname() == '' ? ':Vaffle .<cr>':':Vaffle %<cr>'
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude plugged'
let $FZF_PREVIEW_COMMAND = 'bat --color=always --style=plain -n -- {} || cat {}'
let g:fzf_layout = {'window': { 'width': 0.7, 'height': 0.4,'yoffset':0.85,'xoffset': 0.5 } }
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>

" lsp/complete/lint
Plug 'natebosch/vim-lsc'
let g:lsc_server_commands = {
      \ 'vim': {
        \   'command': 'vim-language-server --stdio',
        \   'log_level': -1,
        \   'suppress_stderr': v:true
        \ },
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
      \ 'GoToDefinition': 'gd',
      \ 'FindReferences': 'gr',
      \ 'ShowHover': 'K',
      \ 'FindCodeActions': 'ga',
      \ 'Completion': 'omnifunc'
      \ }
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'
Plug 'neomake/neomake'
let g:neomake_highlight_columns = 0
autocmd vimRc FileType *
      \ call neomake#configure#automake_for_buffer('rnw', 100)
let g:neomake_error_sign = {
      \ 'text': '•',
      \ 'texthl': 'GitGutterDelete',
      \ }
let g:neomake_warning_sign = {
      \   'text': '•',
      \   'texthl': 'GitGutterChange',
      \ }
Plug 'maralla/completor.vim', { 'branch': 'lsp_more' }
let g:completor_completion_delay = 200
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
let g:completor_scss_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'

" lang
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
Plug 'yuezk/vim-js', { 'for': 'javascript' }

" edit
Plug 'editorconfig/editorconfig-vim'
Plug 'wellle/targets.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
Plug 'junegunn/gv.vim'
Plug 'gotchane/vim-git-commit-prefix'
Plug 'whiteinge/diffconflicts'
Plug 'hotwatermorning/auto-git-diff'

"misc
Plug 'romainl/vim-cool'
Plug 'romainl/vim-qf'
Plug 'tpope/vim-repeat'
Plug 'markonm/traces.vim'
Plug 'AndrewRadev/quickpeek.vim', { 'for': 'qf' }
autocmd vimRc Filetype qf nnoremap <buffer> gp :QuickpeekToggle<cr>
Plug 'lambdalisue/edita.vim'
Plug 'hauleth/asyncdo.vim'
Plug 'fcpg/vim-altscreen'
Plug 'markonm/hlyank.vim', { 'commit': '39e52017' }
Plug 'basilgood/vim-system-copy'
Plug 'vim-scripts/cmdline-completion'
Plug 'mbbill/undotree'

" theme
Plug 'basilgood/barow'
Plug 'morhetz/gruvbox'
call plug#end()

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
set listchars=tab:┊\ ,trail:•,nbsp:␣,extends:↦,precedes:↤
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
  set grepprg=rg\ --vimgrep\ --no-heading
endif
set grepformat^=%f:%l:%c:%m
set backspace=indent,eol,start
set laststatus=2


" mappings
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
" substitute.
nnoremap ss :%s/
nnoremap sl :s/
xnoremap ss :s/
nnoremap sp vip:s/
nnoremap sn *Ncgn
" c-g improved
nnoremap <silent> <C-g> :echon '['.expand("%:p:~").']'.' [L:'.line('$').']'<Bar>echon ' ['system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")']'<CR>
" reload syntax and nohl
nnoremap <silent><expr> <C-l> empty(get(b:, 'current_syntax'))
      \ ? "\<C-l>"
      \ : "\<C-l>:syntax sync fromstart\<cr>:nohlsearch<cr>"
" execute macro
nnoremap Q <Nop>
nnoremap Q @q
" run macro on selected lines
vnoremap Q :norm Q<cr>
" jump to window no
for i in range(1, 9)
  execute 'nnoremap <silent> <space>'.i.' :'.i.'wincmd w<CR>'
endfor
execute 'nnoremap <silent> <space>0 :wincmd p<CR>'
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

syntax enable

colorscheme min

set secure
