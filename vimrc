unlet! skip_defaults_vim
silent! source $VIMRUNTIME/defaults.vim

scriptencoding utf-8

let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1
let g:sh_noisk = 1

augroup vimRc
  autocmd!
augroup END

if empty(glob('~/.vim/pack/packager/opt/vim-packager'))
  silent !git clone https://github.com/kristijanhusak/vim-packager
        \ ~/.vim/pack/packager/opt/vim-packager
endif

function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', {'type': 'opt'})
  call packager#add('junegunn/fzf.vim')
  call packager#add('ycm-core/YouCompleteMe', { 'do': './install.py --ts-completer' })
  call packager#add('dense-analysis/ale', {'type': 'opt'})
  call packager#add('editorconfig/editorconfig-vim')
  call packager#add('tpope/vim-fugitive')
  call packager#add('airblade/vim-gitgutter')
  call packager#add('tpope/vim-rhubarb', {'type': 'opt'})
  call packager#add('junegunn/gv.vim', {'type': 'opt'})
  call packager#add('sodapopcan/vim-twiggy', {'type': 'opt'})
  call packager#add('christoomey/vim-system-copy', {'type': 'opt'})
  call packager#add('wellle/targets.vim', {'type': 'opt'})
  call packager#add('haya14busa/vim-asterisk', {'type': 'opt'})
  call packager#add('gabesoft/vim-ags')
  call packager#add('mbbill/undotree', {'type': 'opt'})
  call packager#add('tomtom/tcomment_vim', {'type': 'opt'})
  call packager#add('tpope/vim-surround', {'type': 'opt'})
  call packager#add('tpope/vim-repeat', {'type': 'opt'})
  call packager#add('pakutoma/toggle-terminal', {'type': 'opt'})
  call packager#add('itchyny/vim-cmdline-ranges', {'type': 'opt'})
  call packager#add('markonm/hlyank.vim', {'type': 'opt'})
  call packager#add('gotchane/vim-git-commit-prefix', {'type': 'opt'})
  call packager#add('whiteinge/diffconflicts', {'type': 'opt'})
  call packager#add('vim-scripts/cmdline-completion', {'type': 'opt'})
  call packager#add('romainl/vim-cool', {'type': 'opt'})
  call packager#add('basilgood/smarttab.vim', {'type': 'opt'})
  call packager#add('hotwatermorning/auto-git-diff', {'type': 'opt'})
  call packager#add('romgrk/winteract.vim', {'type': 'opt'})
  call packager#add('basilgood/memolist.vim', {'type': 'opt'})
  call packager#add('MaxMEllon/vim-jsx-pretty')
  call packager#add('pangloss/vim-javascript')
  call packager#add('markonm/traces.vim')
  call packager#add('stefandtw/quickfix-reflector.vim')
  call packager#add('lambdalisue/edita.vim')
  call packager#add('hauleth/asyncdo.vim')
  call packager#add('fcpg/vim-altscreen')
  call packager#add('basilgood/hydrangea-vim', {'type': 'opt'})
endfunction

command! -nargs=* -bar PackagerInstall call PackagerInit() | call packager#install(<args>)
command! -nargs=* -bar PackagerUpdate call PackagerInit() | call packager#update(<args>)
command! -bar PackagerClean call PackagerInit() | call packager#clean()
command! -bar PackagerStatus call PackagerInit() | call packager#status()

" pack add and config
silent! packadd! vim-twiggy
silent! packadd! vim-rhubarb
silent! packadd! vim-system-copy
silent! packadd! targets.vim
silent! packadd! tcomment_vim
silent! packadd! vim-surround
silent! packadd! vim-repeat
silent! packadd! toggle-terminal
silent! packadd! vim-cmdline-ranges
silent! packadd! hlyank.vim
silent! packadd! vim-git-commit-prefix
silent! packadd! diffconflicts
silent! packadd! cmdline-completion
silent! packadd! vim-cool
autocmd vimRc InsertEnter * packadd smarttab.vim
silent! packadd! auto-git-diff
silent! packadd! winteract.vim
silent! packadd! memolist.vim
silent! packadd! vim-wordmotion

" fzf
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude plugged'
let $FZF_PREVIEW_COMMAND = 'bat --color=always --style=plain -n -- {} || cat {}'
let g:fzf_layout = {'window': { 'width': 0.7, 'height': 0.4,'yoffset':0.85,'xoffset': 0.5 } }
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>
nnoremap st :Files tests<cr>

" netrw
let g:netrw_bufsettings = 'nomodifiable nomodified relativenumber nowrap readonly nobuflisted'
let g:netrw_banner = 0
let g:netrw_altfile = 1
let g:netrw_altv = 1
let g:netrw_preview = 1
let g:netrw_alto = 0
let g:netrw_use_errorwindow = 0
let g:netrw_list_hide = '^\.\.\=/\=$'
nnoremap <expr><silent> - bufname() == '' ? ':edit .<cr>':':edit %:h<cr>'
function! s:innetrw() abort
  nmap <buffer><silent> <right> <cr>
  nmap <buffer><silent> <left> -
  nmap <buffer> <TAB> mf
  nmap <buffer> <S-TAB> mF
  nmap <buffer> <c-x> mfmx
  hi! link netrwSymLink Comment
  hi! link netrwPlain Comment
  hi netrwDir guifg=#8961b7
endfunction
autocmd vimRc FileType netrw call s:innetrw()

" complete
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_stop_completion = ['<Enter>']
let g:ycm_auto_hover=''
autocmd vimRc Filetype javascript,typescript nmap K <plug>(YCMHover)
autocmd vimRc Filetype javascript,typescript nmap gd :YcmCompleter GoToDefinition<cr>

" lint
silent! packadd! ale
let g:ale_set_highlights = 0
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_echo_msg_format = '%s'
let g:ale_linters = {
      \ 'jsx': ['eslint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint']
      \}
let g:ale_fixers = {
      \ 'jsx': ['eslint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'nix': ['nixpkgs-fmt']
      \}
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}
nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" fugitive
nnoremap [git]  <Nop>
nmap <space>g [git]
nnoremap <silent> [git]s :<C-u>Gstatus<cr>
nnoremap <silent> [git]d :<C-u>Gvdiffsplit!<cr>gg']

" gitgutter
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" gv
silent! packadd! gv.vim
autocmd vimRc FileType GV nmap R q:GV --all<cr>
autocmd vimRc FileType GV nmap gfa :G fetch --all --prune<cr>
autocmd vimRc FileType GV nmap gr :G rebase<space>
command! GA GV --all

" asterisk
silent! packadd! vim-asterisk
map *  <Plug>(asterisk-z*)

" undotree
silent! packadd! undotree
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

" terminal toggle
tnoremap <silent> <F2> <C-w>:ToggleTerminal<CR>
nnoremap <silent> <F2> :ToggleTerminal<CR>
if &shell ==? '/run/current-system/sw/bin/bash'
  let g:toggle_terminal#command = 'bash'
else
  let g:toggle_terminal#command = 'nix-shell'
endif

" cmdline ranges
let g:cmdline_ranges_default_mapping = 0
cmap <c-down> <Plug>(cmdline-ranges-j)
cmap <c-up> <Plug>(cmdline-ranges-k)
cmap <c-j> <Plug>(cmdline-ranges-})
cmap <c-k> <Plug>(cmdline-ranges-{)

" cool
let g:CoolTotalMatches = 1

" interract
nmap gw :InteractiveWindow<CR>

" memo
let g:memolist_fzf = 1
let g:memolist_path = '~/.notes'

filetype plugin indent on

" personal options
if exists('$TMUX')
  set term=xterm-256color
endif
set t_Co=256
set t_ut=
set t_md=

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set path& | let &path .= '**'
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
set switchbuf+=useopen,usetab
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
set regexpengine=1
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
set helplang=en spelllang=en_us
set history=1000
set viminfo+=!
set wildmenu
set wildmode=list,full
set wildignorecase
set wildcharm=<C-Z>
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
endif
set grepformat^=%f:%l:%c:%m
set tabline=%!functions#tabline()
set laststatus=2
set statusline=
set statusline=\ %{winnr().':'}
set statusline+=\ %f%m
set statusline+=\ %#LineNR#
set statusline+=%h%w%q%r
set statusline+=\ %{exists('g:asyncdo')?'runing':''}
set statusline+=%=
set statusline+=%{&filetype}
set statusline+=\ %#StatusLineNC#
set statusline+=\ %4l\ %3c
set statusline+=\ %{''}

" mappings
autocmd vimRc CmdwinEnter * nnoremap <buffer> <cr> <cr>
autocmd vimRc FileType qf nnoremap <buffer> <cr> <cr>
autocmd vimRc FileType git nnoremap <buffer> <cr> <cr>
tnoremap <c-q> <c-w>N
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
nnoremap Y y$
nnoremap <silent> <C-w>z :wincmd z<Bar>cclose<Bar>lclose<CR>
" objects
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>
" paste ciw
vnoremap P "0p
" s char
nnoremap s <Nop>
nmap s{ ysiw{
nmap s} ysiw}
nmap s[ ysiw[
nmap s] ysiw]
nmap s( ysiw(
nmap s) ysiw)
nmap s" ysiw"
nmap s' ysiw'
nmap s` ysiw`
" substitute
nnoremap ss :%s/
nnoremap sl :s/
nnoremap sr :<c-r>=line('.')<cr>
nnoremap sp vip:s/
vnoremap s  :s/
" search and replace
nnoremap sn *Ncgn
" diff two buffers
nnoremap <silent> <expr> <space>dt ":<C-u>"."windo ".(&diff?"diffoff":"diffthis")."<CR>"
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
" buffers
nnoremap <space>b :b<space><c-z>
" jump to window no
for i in range(1, 9)
  execute 'nnoremap <silent> <space>'.i.' :'.i.'wincmd w<CR>'
endfor
execute 'nnoremap <silent> <space>0 :wincmd p<CR>'
" jumping
nnoremap <silent> ]q :call functions#listjump("c", "next", "first")<CR>
nnoremap <silent> [q :call functions#listjump("c", "previous", "last")<CR>
nnoremap <silent> ]w :call functions#listjump("l", "next", "first")<CR>
nnoremap <silent> [w :call functions#listjump("l", "previous", "last")<CR>

" range commands
cnoremap <c-x>t <CR>:t''<CR>
cnoremap <c-x>m <CR>:m''<CR>
cnoremap <c-x>d <CR>:d<CR>``

" autocmds
" format
autocmd vimRc FileType nix setlocal makeprg=nix-instantiate\ --parse
autocmd vimRc FileType nix setlocal formatprg=nixpkgs-fmt
autocmd vimRc BufRead,BufNewFile *.nix command! FM silent call system('nixpkgs-fmt ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx,*.ts,*.tsx command! FM silent call system('prettier --single-quote --trailing-comma none --write ' . expand('%'))
autocmd vimRc BufRead,BufNewFile *.js,*.jsx command! Fix silent call system('eslint --fix ' . expand('%'))
autocmd vimRc FileType yaml command! FM silent call system('prettier --write ' . expand('%'))
autocmd vimRc FileType sh command! FM silent call system('shfmt -i 2 -ci -w ' . expand('%'))

" large files > 10mb
let g:large_file = 10485760
autocmd vimRc BufReadPre *
      \ let f=expand("<afile>") |
      \ if getfsize(f) > g:large_file |
      \ set eventignore+=FileType |
      \ setlocal noswapfile bufhidden=unload undolevels=-1 buftype=nowrite |
      \ GitGutterBufferDisable |
      \ else |
      \ set eventignore-=FileType |
      \ endif

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

" autowrite only in this case
autocmd vimRc WinLeave *
      \ ++nested if &modifiable && &modified && filereadable(expand('%')) | update | endif

" set nonumber in terminal window
autocmd vimRc BufWinEnter *
      \ if &l:buftype == 'terminal' | setlocal nonumber | endif

" mkdir
autocmd vimRc BufWritePre *
      \ if !isdirectory(expand('%:h', v:true)) |
      \   call mkdir(expand('%:h', v:true), 'p') |
      \ endif

" sessions
autocmd vimRc VimLeave * call functions#makesession(1)
command! SS call functions#loadsession()

" filetypes
let g:markdown_fenced_languages = ['vim', 'ruby', 'html', 'javascript', 'css', 'bash=sh', 'sh']
autocmd vimRc BufReadPre *.md,*.markdown setlocal conceallevel=2 concealcursor=n
autocmd vimRc FileType javascript setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd vimRc BufNewFile,BufRead *.gitignore setfiletype gitignore
autocmd vimRc BufNewFile,BufRead *.twig      setfiletype twig.html
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
command! LCD lcd %:p:h
command! -bar HL echo
      \ synIDattr(synID(line('.'),col('.'),0),'name')
      \ synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')
command! -nargs=1 TV
      \ call system('tmux split-window -h '.<q-args>)
command! TA TV tig --all
command! TS TV tig status
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

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
command! -bang -nargs=* Rr
      \ call fzf#vim#grep(
      \ "rg --column --line-number --no-heading --color=always --smart-case " .
      \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)
command! Gdiffsplit call functions#diffsplit()

syntax enable

try
  silent! colorscheme hydrangea
catch
endtry

set secure
