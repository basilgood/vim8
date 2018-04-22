scriptencoding utf-8

silent! set shell=/bin/sh

augroup MyVimrc
  autocmd!
augroup END
command! -nargs=* AutoCmd autocmd MyVimrc <args>

let g:loaded_vimballPlugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1
let g:sh_noisk = 1
let g:loaded_matchparen = 1
let g:loaded_netrwPlugin = 1

silent! set number nowrap
silent! set noshowmatch matchtime=1 shortmess+=I
silent! set noruler rulerformat= laststatus=2 statusline=%f\ %=\ %m%r%y%w\ %3l/%L:%-2c
silent! set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:»,precedes:«,nbsp:⦸ 
silent! set splitbelow splitright switchbuf=useopen,usetab 
silent! set scrolloff=5 sidescroll=1 sidescrolloff=5 nostartofline
if &startofline
  augroup vimrc_stayput
    autocmd!
    autocmd BufLeave * set nostartofline |
          \ autocmd vimrc_stayput CursorMoved,CursorMovedI * set startofline |
          \ autocmd! vimrc_stayput CursorMoved,CursorMovedI
  augroup END
endif
if exists('$TMUX')
  let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
  let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
else
  let &t_SI .= "\<Esc>[6 q"
  let &t_SR .= "\<Esc>[4 q"
  let &t_EI .= "\<Esc>[2 q"
endif
silent! set smartindent autoindent shiftround shiftwidth=2 expandtab tabstop=2 smarttab softtabstop=2
silent! set foldclose=all foldcolumn=0 nofoldenable foldlevel=0 foldmarker& foldmethod=indent
silent! set backspace=indent,eol,start nrformats=hex formatoptions=cmMj nojoinspaces
silent! set hidden autoread mouse=a modeline& modelines&
silent! set history=1000 viminfo='10,/100,:1000,<10,@10,s10,h
silent! set noswapfile nobackup
silent! set incsearch hlsearch|nohlsearch
silent! set complete=.,w,b,u,t,i,k omnifunc=syntaxcomplete#Complete
silent! set completeopt=menuone,preview,noinsert,noselect pumheight=10
silent! set wildmenu wildoptions= wildignorecase
silent! set updatetime=300 timeoutlen=1000 ttimeout ttimeoutlen=50 ttyfast lazyredraw
if executable('rg')
  set grepprg=rg\ --vimgrep " \ --no-heading
  set grepformat^=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap ]] ]m
nnoremap [[ [m
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
nnoremap <C-q> :bwipeout<CR>
nnoremap ,q :bdelete<CR>
nnoremap <silent><expr> <Space>x winnr('$') != 1 ? ':<C-u>close<CR>' : ""
xnoremap <C-s> <C-C>:<C-u>update<CR>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
nnoremap H ^
nnoremap L $
vnoremap L g_
nnoremap <silent> <Tab> :wincmd w<CR>
nnoremap <silent> <S-Tab> :wincmd W<CR>
nnoremap <silent> <C-Up> :resize -1<CR>
nnoremap <silent> <C-Down> :resize +1<CR>
nnoremap <silent> <C-Left> :vertical resize +1<CR>
nnoremap <silent> <C-Right> :vertical resize -1<CR>
vnoremap . :normal .<CR>
nnoremap ,w :set wrap!<cr>
nnoremap <Leader>w :%s/\s\+$//e<CR>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Space><Space> :tabnew %<CR>
nnoremap <Space>q :tabclose<CR>
vnoremap <Space>y "+
vnoremap <Space>p "+
nnoremap <Space>p "+
inoremap <C-v> <ESC>"+gPa
nnoremap <Space>s :OverCommandLine<CR>%s/
nnoremap <Space>S :OverCommandLine<CR>s/
vnoremap <Space>s :OverCommandLine<CR>s/
nnoremap <Space>k :call SyntaxAttr()<CR>
map <Leader><Leader> :set cursorline!<CR>
nnoremap <silent> n nzz:call blink#Match()<CR>
nnoremap <silent> N Nzz:call blink#Match()<CR>
cnoremap <silent> <expr> <enter> center#Search()
nnoremap gr :vimgrep <cword> *<CR>
nnoremap ,f :GrepJob! '\b<C-R><C-W>\b'<CR>:cw<CR>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command! -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
map [1;5A <C-Up>
map [1;5B <C-Down>
map [1;5C <C-Left>
map [1;5D <C-Right>
map [1;2A <S-Up>
map [1;2B <S-Down>
map [1;2C <S-Right>
map [1;2D <S-Left>

AutoCmd FocusGained,BufEnter,CursorHold,CursorHoldI * if !bufexists("[Command Line]") | silent! checktime | endif
AutoCmd BufEnter * syntax sync minlines=99999
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line('$') | exe 'normal! g`"zz' | endif
AutoCmd CmdLineEnter * packadd cmdline-completion
AutoCmd BufWritePre * call mkdir#Easy()
" AutoCmd QuickfixCmdPost [^l]* nested copen | wincmd p
" AutoCmd QuickfixCmdPost l* nested lopen | wincmd p
AutoCmd BufEnter * call timer_start(100, function('pack_delayed#plugins'))

" buffergator
let g:buffergator_suppress_keymaps = 1
nnoremap <Bs> :BuffergatorOpen<CR>

" editorconfig
let g:editorconfig_root_chdir = 1
let g:editorconfig_verbose = 1
let g:editorconfig_blacklist = {
      \ 'filetype': ['git.*', 'fugitive'],
      \ 'pattern': ['\.un~$']}

" leaderf
let g:Lf_ShortcutF = '<C-P>'
" let g:Lf_ShortcutB = '<Bs>'
let g:Lf_WindowHeight = 0.20
let g:Lf_DefaultMode = 'FullPath'
let g:Lf_FollowLinks = 'yes'
nnoremap <Leader>m :LeaderfMru<CR>
nnoremap <Leader>n :LeaderfMruCwd<CR>
nnoremap <Leader>k :LeaderfHistoryCmd<CR>

" asterisk
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1

" ale lint
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)
let g:ale_sign_error = '→'
let g:ale_sign_warning = '→'
let g:ale_sign_info = 'i'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_pattern_options_enabled = 1
let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ 'html': ['eslint']
      \}
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'html': ['eslint'],
      \}
let g:ale_linter_aliases = {
      \ 'html': 'javascript',
      \}

" prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#use_tabs = 'true'

filetype plugin indent on
silent! syntax enable
