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
packadd! cfilter

" minpac
if has('vim_starting')
  if empty(glob('~/.vim/pack/minpac/opt/minpac'))
    echo 'Install minpac ...'
    execute 'silent! !git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac'
  endif
endif

function! PackInit()
  command! -nargs=+ Pack call minpac#add(<args>)
  packadd minpac
  call minpac#init()

  " Plugins
  Pack 'k-takata/minpac', {'type': 'opt'}

  Pack 'tpope/vim-vinegar', {'type': 'opt'}
  Pack 'junegunn/fzf'
  Pack 'junegunn/fzf.vim', {'type': 'opt'}
  Pack 'neoclide/coc.nvim', {'rev': 'release', 'type': 'opt'}
  Pack 'neomake/neomake', {'type': 'opt'}
  Pack 'vim-autoformat/vim-autoformat', {'type': 'opt'}

  " lang
  Pack 'maxmellon/vim-jsx-pretty'
  Pack 'yuezk/vim-js'
  Pack 'LnL7/vim-nix'
  Pack 'cespare/vim-toml'

  " misc
  Pack 'editorconfig/editorconfig-vim', {'type': 'opt'}
  Pack 'tpope/vim-commentary', {'type': 'opt'}
  Pack 'tpope/vim-surround', {'type': 'opt'}
  Pack 'tpope/vim-repeat', {'type': 'opt'}
  Pack 'wellle/targets.vim', {'type': 'opt'}
  Pack 'tommcdo/vim-exchange', {'type': 'opt'}
  Pack 'haya14busa/vim-asterisk', {'type': 'opt'}
  Pack 'markonm/traces.vim', {'type': 'opt'}
  Pack 'jesseleite/vim-agriculture', {'type': 'opt'}
  Pack 'stefandtw/quickfix-reflector.vim'
  Pack 'mbbill/undotree', {'type': 'opt'}
  Pack 'basilgood/memolist.vim', {'type': 'opt'}
  Pack 'markonm/hlyank.vim', { 'rev': '39e52017', 'type': 'opt' }
  Pack 'AndrewRadev/quickpeek.vim', {'type': 'opt'}
  Pack 'fcpg/vim-altscreen'
  Pack 'voldikss/vim-floaterm', {'type': 'opt'}

  " git
  Pack 'tpope/vim-fugitive', {'type': 'opt'}
  Pack 'airblade/vim-gitgutter', {'type': 'opt'}
  Pack 'tpope/vim-rhubarb', {'type': 'opt'}
  Pack 'whiteinge/diffconflicts', {'on': 'DiffConflicts'}
  Pack 'hotwatermorning/auto-git-diff'
  Pack 'gotchane/vim-git-commit-prefix'
  Pack 'junegunn/gv.vim', {'type': 'opt'}

  " theme
  Pack 'basilgood/cinnamon-vim', {'type': 'opt'}
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

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
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'100%', 'window': { 'width': 1, 'height': 1,'yoffset':0.5,'xoffset': 0.5 } }
autocmd vimRc VimEnter * ++once packadd fzf.vim
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>

" agriculture
autocmd vimRc BufRead * ++once packadd vim-agriculture
nmap <leader>/ <Plug>RgRawSearch
vmap <leader>/ <Plug>RgRawVisualSelection
nmap <leader>* <Plug>RgRawWordUnderCursor


" coc
packadd! coc.nvim
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier'
      \ ]

let g:coc_user_config = {
      \ 'suggest.autoTrigger': 'always',
      \ 'suggest.noselect': 0,
      \ 'diagnostic': {
        \ 'errorSign': ' ',
        \ 'warningSign': ' ',
        \ 'infoSign': ' ',
        \ 'hintSign': ' ',
        \ 'highlighLimit': 0,
        \ },
        \   'languageserver': {
          \ 'rnix': {
            \'command': 'rnix-lsp',
            \'filetypes': ['nix']
            \},
            \}
            \}

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>k :call CocActionAsync('showSignatureHelp')<CR>
nmap [e <Plug>(coc-diagnostic-prev)
nmap ]e <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" lint
autocmd vimRc BufRead * ++once packadd neomake | call neomake#configure#automake('nrwi', 500)
let g:neomake_highlight_columns = 0
nnoremap ]a :NeomakeNextLoclist<cr>
nnoremap [a :NeomakePrevLoclist<cr>

" autoformat
autocmd vimRc BufRead * ++once packadd vim-autoformat
" editorconfig
packadd! editorconfig-vim

" traces
autocmd vimRc CmdlineEnter * ++once packadd traces.vim
let g:traces_num_range_preview = 1

" asterisk
autocmd vimRc BufRead * ++once packadd vim.asterisk
nmap *  <Plug>(asterisk-z*)
vmap *  <Plug>(asterisk-z*)

" git
autocmd vimRc VimEnter * ++once packadd vim-gitgutter
let g:gitgutter_grep = 'rg'
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
autocmd vimRc CmdlineEnter * ++once packadd vim-rhubarb
autocmd vimRc FileType GV nmap <buffer><silent> a q:GV --all<cr>
autocmd vimRc FileType GV nmap <buffer><silent> r q:GV<cr>


" memolist
autocmd vimRc CmdlineEnter * ++once packadd memolist.vim
let g:memolist_memo_suffix = 'md'
let g:memolist_fzf = 1

" undotree
autocmd vimRc CmdlineEnter * ++once packadd undotree
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

" quickpeek
packadd! quickpeek.vim
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

" floaterm
autocmd vimRc BufRead * ++once packadd vim-floaterm
let g:floaterm_autoclose = 2
let g:floaterm_keymap_toggle = '<C-h>'

" plugins
packadd! editorconfig-vim
autocmd vimRc CmdlineEnter * ++once packadd vim-fugitive
autocmd vimRc CmdlineEnter * ++once packadd vim-rhubarb
autocmd vimRc CmdlineEnter * ++once packadd diffconflicts
autocmd vimRc CmdlineEnter * ++once packadd gv.vim
autocmd vimRc BufRead * ++once packadd vim-commentary
autocmd vimRc BufRead * ++once packadd vim-surround
autocmd vimRc BufRead * ++once packadd vim-repeat
autocmd vimRc BufRead * ++once packadd targets.vim
autocmd vimRc BufRead * ++once packadd vim-exchange
autocmd vimRc BufRead * ++once packadd vim-asterisk
autocmd vimRc BufRead * ++once packadd traces.vim
autocmd vimRc BufRead * ++once packadd hlyank.vim

filetype plugin indent on

" options
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"
set t_ut=
set t_md=
set path=.,**
set wildignore+=
      \*/node_modules/*,
      \*/.git/*,
      \*/recordings/*,
      \*/pack
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
set statusline=%<%.99{expand('%:p:h:t')}/%t\ %y%*%h%w%m%r%=%c:%l/%L

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
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>
" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>
" copy/paste
nnoremap ]0 viw"0p
xnoremap ]0 "0p
" substitute
nnoremap cg* *``cgn
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
if empty(glob('~/.cache/vim/sessions')) > 0
  call mkdir(expand('~/.cache/vim/sessions'), 'p')
end
autocmd! vimRc VimLeavePre * execute "mksession! ~/.cache/vim/sessions/" . split(getcwd(), "/")[-1] . ".vim"
command! -nargs=0 SS :execute 'source ~/.cache/vim/sessions/' .  split(getcwd(), '/')[-1] . '.vim'

" grep
function! s:grep(word) abort
  let cmd = printf('rg --vimgrep --no-heading %s', a:word)
  cgetexpr system(cmd) | cw
endfunction
command! -nargs=1 -complete=file Grep call <SID>grep(<q-args>)

syntax enable
set termguicolors
colorscheme saffran

set secure
