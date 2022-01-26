set encoding=utf-8
scriptencoding utf-8

augroup vimRc
  autocmd!
augroup END

" Echo startup time on start.
if !v:vim_did_enter && has('reltime')
  let s:startuptime = reltime()
  au vimRc VimEnter * ++once let s:startuptime = reltime(s:startuptime) | redraw
        \ | echomsg 'startuptime: ' .. reltimestr(s:startuptime)
endif

packadd! matchit
packadd! cfilter

" plug
if has('vim_starting')
  if empty(glob('~/.vim/autoload/plug.vim'))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs'
          \ 'https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  endif
endif

call plug#begin('~/.vim/plugged')

" navigation
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
Plug 'junegunn/fzf'
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5 } }
Plug 'junegunn/fzf.vim'
nnoremap <c-p> :Files<cr>
nnoremap <bs> :Buffers<cr>

" completion
Plug 'prabirshrestha/vim-lsp'
let g:lsp_document_highlight_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
nmap <plug>() <Plug>(lsp-float-close)
Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/ddc-converter_remove_overlap'
Plug 'LumaKernel/ddc-file'
Plug 'shun/ddc-vim-lsp'
Plug 'matsui54/denops-popup-preview.vim'
Plug 'vim-denops/denops.vim'

" term
Plug 'voldikss/vim-floaterm'
" floaterm
let g:floaterm_autoclose = 2
let g:floaterm_keymap_toggle = '<leader>]'

" lang
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'LnL7/vim-nix', { 'for': 'nix' }
Plug 'cespare/vim-toml', { 'for': 'toml' }

" lint
Plug 'dense-analysis/ale'
let g:ale_disable_lsp = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
nmap <silent> [a <Plug>(ale_previous)
nmap <silent> ]a <Plug>(ale_next)
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none --arrow-parens avoid --print-width 140'
let g:ale_sh_shfmt_options = '-i 2 -ci'
let g:ale_linters = {}
let g:ale_linters.json = ['jsonlint']
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['prettier', 'eslint'],
      \   'typescript': ['prettier', 'eslint'],
      \   'json': ['prettier'],
      \   'css': ['stylelint'],
      \   'sh': ['shfmt'],
      \   'nix': ['nixpkgs-fmt'],
      \ }

" edit
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
let g:gitgutter_grep = 'rg'
let g:gitgutter_sign_priority = 8
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)

Plug 'whiteinge/diffconflicts', { 'on': [ 'DiffConflicts' ] }
Plug 'hotwatermorning/auto-git-diff', { 'for': 'gitrebase' }
Plug 'gotchane/vim-git-commit-prefix', { 'for': 'gitcommit' }
Plug 'junegunn/gv.vim'
autocmd vimRc FileType GV nmap <buffer><silent> a q:GV --all<cr>
autocmd vimRc FileType GV nmap <buffer><silent> r q:GV<cr>

Plug 'tpope/vim-rhubarb'

" misc
Plug 'lifepillar/vim-colortemplate', { 'on': [ 'Colortemplate' ] }
Plug 'wellle/targets.vim'
Plug 'haya14busa/vim-asterisk'
map *  <Plug>(asterisk-z*)

Plug 'tpope/vim-repeat'
Plug 'romainl/vim-cool'
Plug 'vim-scripts/cmdline-completion'
Plug 'markonm/traces.vim'
let g:traces_num_range_preview = 1

Plug 'AndrewRadev/quickpeek.vim', { 'for': 'qf' }
autocmd vimRc Filetype qf nnoremap <buffer> <tab> :QuickpeekToggle<cr>

Plug 'basilgood/memolist.vim', { 'on': [ 'MemoNew', 'MemoList', 'MemoGrep' ] }
let g:memolist_memo_suffix = 'md'
let g:memolist_fzf = 1

Plug 'fcpg/vim-altscreen'
Plug 'jesseleite/vim-agriculture'
nmap <leader>/ <Plug>RgRawSearch
vmap <leader>/ <Plug>RgRawVisualSelection
nmap <leader>* <Plug>RgRawWordUnderCursor

Plug 'markonm/hlyank.vim', { 'commit': '39e52017' }
Plug 'mbbill/undotree', { 'on': [ 'UndotreeToggle' ] }
let g:undotree_WindowLayout = 4
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1

" theme
Plug 'basilgood/cinnamon-vim'

call plug#end()

" completion
call ddc#custom#patch_global('sources', ['around', 'vim-lsp', 'file'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
        \   'matchers': ['matcher_head'],
        \   'sorters': ['sorter_rank'],
        \   'converters': ['converter_remove_overlap'],
        \ }
        \ })
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'Around'}
      \ })
call ddc#custom#patch_global('sourceOptions', {
      \ 'vim-lsp': {
        \   'mark': 'Lsp',
        \   'matchers': ['matcher_head'],
        \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
        \ }
        \ })
call ddc#custom#patch_global('sourceOptions', {
      \ 'file': {
        \   'mark': 'File',
        \   'isVolatile': v:true,
        \   'forceCompletionPattern': '\S/\S*'
        \ }
        \ })
call ddc#enable()
call popup_preview#enable()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? '<C-n>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'
inoremap <silent><expr> <cr> pumvisible() ? ddc#map#confirm() : "\<C-g>u\<CR>"

if executable('typescript-language-server')
  au vimRc User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
        \ })
endif
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  let g:lsp_diagnostics_highlights_enabled = 0
  let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
  " let g:lsp_diagnostics_virtual_text_enabled = 1
  let g:lsp_completion_documentation_enabled = 0
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
endfunction
augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

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
set splitright splitbelow
set fillchars=vert:\│,fold:-
set virtualedit=onemore
set sidescrolloff=10 sidescroll=1
set sessionoptions-=options
set sessionoptions-=blank
set sessionoptions-=help
set lazyredraw
set notimeout ttimeout timeoutlen=100
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
" relativenumber
nnoremap <silent> cor mP:windo set relativenumber!<cr>mP
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

" commands
command! -nargs=1 -complete=file Rename file <args> | call delete(expand('#')) | write
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
nnoremap <silent> gr :set opfunc=<SID>GrepMotion<CR>g@
xnoremap <silent> gr :<C-U>call <SID>GrepMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
  if a:type ==# 'v'
    silent execute 'normal! `<' . a:type . '`>y'
  elseif a:type ==# 'char'
    silent execute 'normal! `[v`]y'
  endif
endfunction

function! s:GrepMotion(type) abort
  let reg_save = @@

  call s:CopyMotionForType(a:type)

  execute ':Grep ' . shellescape(@@)

  let @@ = reg_save
endfunction
function! Grep(...)
  return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file -bar LGrep lgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

autocmd vimRc QuickFixCmdPost cgetexpr cwindow
autocmd vimRc QuickFixCmdPost lgetexpr lwindow

" tabline
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, '&mod')

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname !=? '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  if (exists('g:tablineclosebutton'))
    let s .= '%=%999XX'
  endif
  return s
endfunction
set tabline=%!Tabline()

set termguicolors
colorscheme cinnamon

set secure
