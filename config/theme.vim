scriptencoding utf-8

" let &g:statusline="%{winnr('$')>1?'['.winnr().'/'.winnr('$')"
"       \ . ".(winnr('#')==winnr()?'#':'').']':''}\ "
"       \ . "%{(&previewwindow?'[preview] ':'').expand('%:f')}"
"       \ . "\ %=%{(winnr('$')==1 || winnr('#')!=winnr()) ?
"       \ '['.(&filetype!=''?&filetype.',':'')"
"       \ . ".(&fenc!=''?&fenc:&enc).','.&ff.']' : ''}"
"       \ . "%m%{printf('%'.(len(line('$'))+2).'d/%d',line('.'),line('$'))}"

let s:modes = {
      \ 'n': 'NORMAL',
      \ 'i': 'INSERT',
      \ 'R': 'REPLACE',
      \ 'v': 'VISUAL',
      \ 'V': 'V-LINE',
      \ "\<C-v>": 'V-BLOCK',
      \ 'c': 'COMMAND',
      \ 's': 'SELECT',
      \ 'S': 'S-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ 't': 'TERMINAL'
      \}

let s:prev_mode = ''
function! StatusLineMode()
  let l:cur_mode = get(s:modes, mode(), '')

  if l:cur_mode == s:prev_mode
    return l:cur_mode
  endif

  if l:cur_mode ==? 'NORMAL'
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor guibg=#1c663e cterm=bold ctermbg=148 ctermfg=22'
  elseif l:cur_mode ==? 'INSERT'
    exe 'hi! myModeColor guibg=#70142c cterm=bold ctermbg=23 ctermfg=231'
  elseif l:cur_mode ==? 'VISUAL' || l:cur_mode ==? 'V-LINE' || l:cur_mode ==? 'V_BLOCK'
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor guibg=#370f70 cterm=bold ctermbg=208 ctermfg=88'
  endif

  let s:prev_mode = l:cur_mode
  return l:cur_mode
endfunction

function! StatusLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! StatusLineLeftInfo()
  let l:branch = fugitive#head()
  let l:filename = '' !=# expand('%:f') ? expand('%:f') : '[No Name]'
  if l:branch !=# ''
    return printf('%s | %s', l:branch, l:filename)
  endif
  return l:filename
  exe 'hi! myInfoColor guibg=#2d223d guifg=#c3c4a4 ctermbg=240 ctermfg=252'
endfunction

set statusline=

set statusline+=%#myModeColor#
set statusline+=%{StatusLineMode()}
set statusline+=%*

set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineLeftInfo()}
set statusline+=\ %*

set statusline+=%=

set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineFiletype()}\ %l:%v
set statusline+=\ %*

if exists('$TMUX')
  " let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
  " let &t_SR .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  " let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
else
  " let &t_SI .= "\<Esc>[6 q"
  " let &t_SR .= "\<Esc>[4 q"
  " let &t_EI .= "\<Esc>[2 q"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme happy_hacking
