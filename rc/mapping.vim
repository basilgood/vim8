scriptencoding utf-8

nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv
nnoremap <c-s> :<c-u>update<cr>
inoremap <c-s> <esc>:update<cr>
xnoremap <c-s> <esc>:<c-u>update<cr>
nnoremap <expr> 0 virtcol('.') - 1 <= indent('.') && col('.') > 1 ? '0' : '_'
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
inoremap <c-a> <Home>
inoremap <c-e> <End>
nnoremap }   }zz
nnoremap {   {zz

" windows
" nnoremap <silent> <Tab> :wincmd w<CR>
nnoremap <silent> <Tab> :call functions#nextwindow()<CR>
nnoremap <silent> <S-Tab> :call functions#previouswindowortab()<CR>

" prev and next buffer
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" lists
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>
nnoremap ]Q :clast<cr>
nnoremap [Q :cfirst<cr>

" niceblock
xnoremap <expr> I (mode()=~#'[vV]'?'<C-v>^o^I':'I')
xnoremap <expr> A (mode()=~#'[vV]'?'<C-v>0o$A':'A')

" innerline
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<cr>

" entire
xnoremap <silent> ie gg0oG$
onoremap <silent> ie :<C-U>execute "normal! m`"<Bar>keepjumps normal! ggVG<cr>

" file size
nnoremap <F3> :echo functions#getfilesize()<cr>

" disable EX-mode
nnoremap Q <Nop>
nnoremap gQ <Nop>

" execute macro
nnoremap Q @q
" Run macro on selected lines
vnoremap Q :norm Q<cr>

" search and star search
nnoremap * :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>
nnoremap cn :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>cgn
nnoremap dn :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<C-M>cgn
vnoremap * :<c-u>let @/=functions#get_search_pat()<cr><esc><s-n>

" cmdwinenter
nnoremap <leader><leader> q:i

" smart space mapping
nmap <space> [space]
vmap <space> [space]
nnoremap  [space] <Nop>
vnoremap  [space] <Nop>

" yank from cursor position to end of line
nnoremap Y y$

" yank to clipboard
vnoremap [space]y "+y

" paste from clipboard
nnoremap [space]p :put+<cr>
vnoremap [space]p "+p
nnoremap [space]P :put!+<cr>
vnoremap [space]P "+P

" Paste continuously.
nnoremap [p "0p
nnoremap ]p viw"0p
vnoremap P "0p

" replace a word with clipboard
nnoremap [space]w viw"+p

" switch buffers
nnoremap [space]1 1<c-w>w
nnoremap [space]2 2<c-w>w

nnoremap [space]3 3<c-w>w
nnoremap [space]4 4<c-w>w
nnoremap [space]5 5<c-w>w
nnoremap [space]6 6<c-w>w
nnoremap [space]7 7<c-w>w
nnoremap [space]8 8<c-w>w
nnoremap [space]9 9<c-w>w

" substitute.
nnoremap [subst]   <Nop>
nmap   s [subst]
xmap   s [subst]
nnoremap [subst]s :%s/
nnoremap [subst]l :s/
xnoremap [subst]  :s/
nnoremap [subst]a :%s/\<<c-r><c-w>\>/<c-r><c-w>
nnoremap [subst]p vip :s/
nnoremap [subst]w :%s/\<<c-r><c-w>\>/

" zoom
nnoremap <C-w>t :tabedit %<cr>
nnoremap <C-w>z :tabclose<cr>
nnoremap <silent> <S-tab> :tabnext<CR>

" git commands
nnoremap <silent> <expr> [space]dt ":\<C-u>"."windo ".(&diff?"diffoff":"diffthis")."\<CR>"
