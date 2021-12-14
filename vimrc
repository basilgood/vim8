set encoding=utf-8
scriptencoding utf-8

" autogroup vimRc
augroup vimRc | autocmd! | augroup END

" Echo startup time on start.
if !v:vim_did_enter && has('reltime')
  let s:startuptime = reltime()
  au vimRc VimEnter * ++once let s:startuptime = reltime(s:startuptime) | redraw
        \ | echomsg 'startuptime: ' .. reltimestr(s:startuptime)
endif

if has('vim_starting')
  if empty(glob('~/.vim/autoload/plug.vim'))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs'
          \ 'https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  endif
endif

call plug#begin('~/.vim/plugged')
  " files
  Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
  " term
  Plug 'voldikss/vim-floaterm'
  Plug 'lambdalisue/guise.vim'
  " completion
  Plug 'prabirshrestha/vim-lsp'
  let g:lsp_document_highlight_enabled = 0
  let g:lsp_diagnostics_highlights_enabled = 0
  let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
  let g:lsp_diagnostics_echo_cursor = 1
  Plug 'Shougo/ddc.vim'
  Plug 'Shougo/ddc-around'
  Plug 'Shougo/ddc-matcher_head'
  Plug 'Shougo/ddc-sorter_rank'
  Plug 'Shougo/ddc-converter_remove_overlap'
  Plug 'LumaKernel/ddc-file'
  Plug 'shun/ddc-vim-lsp'
  Plug 'vim-denops/denops.vim'
  " lang
  Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascript' }
  Plug 'yuezk/vim-js', { 'for': 'javascript' }
  Plug 'LnL7/vim-nix', { 'for': 'nix' }
  Plug 'cespare/vim-toml', { 'for': 'toml' }
  " lint
  Plug 'dense-analysis/ale'
  " edit
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  " git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'whiteinge/diffconflicts'
  Plug 'hotwatermorning/auto-git-diff'
  Plug 'salcode/vim-git-stage-hunk'
  "misc
  Plug 'wellle/targets.vim'
  Plug 'mg979/vim-visual-multi'
  Plug 'haya14busa/vim-asterisk'
  map *  <Plug>(asterisk-z*)
  Plug 'tpope/vim-repeat'
  Plug 'markonm/traces.vim'
  Plug 'AndrewRadev/quickpeek.vim', { 'for': 'qf' }
  Plug 'glidenote/memolist.vim'
  let g:memolist_memo_suffix = 'markdown'
  let g:memolist_fzf = 1
  autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>
  Plug 'fcpg/vim-altscreen'
  Plug 'markonm/hlyank.vim', { 'commit': '39e52017' }
  Plug 'mbbill/undotree'
  let g:undotree_WindowLayout = 4
  let g:undotree_SetFocusWhenToggle = 1
  let g:undotree_ShortIndicators = 1
  Plug 'kat0h/bufpreview.vim'
  " theme
  Plug 'mg979/statusline.vim'
  Plug 'mandreyel/vim-japanese-indigo'
  packadd! matchit
  packadd! cfilter
call plug#end()

" completion
call ddc#custom#patch_global('sources', [
      \ 'around',
      \ 'vim-lsp',
      \ 'file'
      \ ])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
        \   'matchers': ['matcher_head'],
        \   'sorters': ['sorter_rank'],
        \   'converters': ['converter_remove_overlap'],
        \ },
        \ 'around': {'mark': 'Around'},
        \ 'vim-lsp': {
          \   'mark': 'Lsp',
          \   'matchers': ['matcher_head'],
          \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
          \ },
          \ 'file': {
            \   'mark': 'File',
            \   'isVolatile': v:true,
            \   'forceCompletionPattern': '\S/\S*'
            \ }
            \ })
call ddc#enable()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? '<C-n>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
inoremap <silent><expr> <cr> pumvisible() ? ddc#map#confirm() : "\<C-g>u\<CR>"

if executable('typescript-language-server')
  au vimRc User lsp_setup call lsp#register_server({
        \ 'name': 'javascript support using typescript-language-server',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  let g:lsp_diagnostics_highlights_enabled = 0
  let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
  let g:lsp_diagnostics_virtual_text_enabled = 1
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ExternalCommand = 'fd "%s" --type f --hidden --follow --exclude .git --exclude plugged'
let g:Lf_RgConfig = ['--max-columns=250']
let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_ShortcutB = '<bs>'
command! History :Leaderf mru<cr>
command! Rg :Leaderf rg<cr>

" ale
let g:ale_disable_lsp = 1
let g:ale_sign_error = '⧽⧽'
let g:ale_sign_warning = '⧽'
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
nmap <silent> [a <Plug>(ale_previous)
nmap <silent> ]a <Plug>(ale_next)
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none --arrow-parens avoid --print-width 140'
let g:ale_sh_shfmt_options = '-i 2 -ci'
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['prettier', 'eslint'],
      \   'typescript': ['prettier', 'eslint'],
      \   'css': ['stylelint'],
      \   'json': ['fixjson'],
      \   'sh': ['shfmt'],
      \   'nix': ['nixpkgs-fmt'],
      \ }

" floaterm
let g:floaterm_autoclose = 2
let g:floaterm_keymap_toggle = '<c-\>'

" gitgutter
let g:gitgutter_grep = 'rg'
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

" netrw
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
nnoremap <silent> - :<C-U>call <SID>opentree()<CR>
autocmd vimRc FileType netrw nmap <buffer><silent> <right> <cr>
autocmd vimRc FileType netrw nmap <buffer><silent> <left> -
autocmd vimRc FileType netrw nmap <buffer> <c-x> mfmx

" options
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
set hidden
set autoread autowrite autowriteall
set noswapfile
set nowritebackup
set undofile undodir=/tmp//,.
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
set breakindent breakindentopt=shift:4,sbr
set noshowmode
set nrformats-=octal
set number
set relativenumber
set mouse=a ttymouse=sgr
set splitright splitbelow
set fillchars+=vert:\│
set virtualedit=onemore
set sidescrolloff=10 sidescroll=1
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=help
set lazyredraw
set ttimeout timeoutlen=2000 ttimeoutlen=50
set updatetime=150
set incsearch hlsearch
set completeopt-=preview
set completeopt+=menuone,noselect,noinsert
set pumheight=10
set diffopt+=context:3,indent-heuristic,algorithm:patience
set list
set listchars=tab:…\ ,trail:•,nbsp:␣,extends:↦,precedes:↤
autocmd vimRc InsertEnter * set listchars-=trail:•
autocmd vimRc InsertLeave * set listchars+=trail:•
set shortmess=
set shortmess+=asoOtIcF
set confirm
set history=1000
set viminfo^=!
set wildmenu
set wildmode=list,full
set wildignorecase
set wildcharm=<C-Z>
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading gfm=%f:%l:%c:%m,%f:%l%m,%f\ \ %l%m
else
  set grepprg=grep\ -rnH\ --exclude=tags\ --exclude-dir=.git\ --exclude-dir=node_modules
endif
set grepformat^=%f:%l:%c:%m
set backspace=indent,eol,start
set laststatus=2
set statusline=%<%.99t\ %y%*%h%w%m%r%=%c:%l/%L

" mappings
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
nnoremap cg* *``cgn
" c-g improved
nnoremap <silent> <C-g> :echon '['.expand("%:p:~").']'.' [L:'.line('$').']'<Bar>echon ' ['system("git rev-parse --abbrev-ref HEAD 2>/dev/null \| tr -d '\n'")']'<CR>
" reload syntax and nohl
nnoremap <silent> <C-l> :noh<bar>diffupdate<bar>call clearmatches()<bar>syntax sync fromstart<cr><c-l>
" execute macro
nnoremap Q <Nop>
nnoremap Q @q
" run macro on selected lines
vnoremap Q :norm Q<cr>

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
command! -nargs=1 -complete=file Rename file <args> | call delete(expand('#')) | write
command! -nargs=0 WS %s/\s\+$// | normal! ``
command! -nargs=0 WT %s/[^\t]\zs\t\+/ / | normal! ``
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
function! Grep(...)
  return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file -bar LGrep lgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

autocmd vimRc QuickFixCmdPost cgetexpr cwindow
autocmd vimRc QuickFixCmdPost lgetexpr lwindow

set termguicolors
colorscheme JapaneseIndigo
hi Visual guibg=#161f2d
hi Search guifg=NONE guibg=#161f2d
hi EndOfBuffer guifg=bg

set secure
