scriptencoding utf-8

function! functions#tabline() abort
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, '&mod')
    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#StatusLine#' : '%#StatusLineNC#')
    let s .= ' ' . tab .':'
    let s .= (bufname !=# '' ? fnamemodify(bufname, ':t') . ' ' : 'No Name ')
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

function! functions#makesession(overwrite) abort
  let b:sessiondir = $HOME . '/.cache/vim/sessions' . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  if a:overwrite == 0 && !empty(glob(b:filename))
    return
  endif
  exe 'mksession! ' . b:filename
endfunction

function! functions#loadsession() abort
  let b:sessiondir = $HOME . '/.cache/vim/sessions' . getcwd()
  let b:sessionfile = b:sessiondir . '/session.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo 'No session loaded.'
  endif
endfunction

function! functions#listjump(list_type, direction, wrap) abort
  try
    exe a:list_type . a:direction
  catch /E553/ " wrap around last item
    exe a:list_type . a:wrap
  catch /E42/
    return
  catch /E163/
    return
  endtry
  normal! zz
endfunction

function! functions#diffsplit() abort
  let s:ft = &filetype
  undo
  vert sp new
  read ++edit #
  diffthis
  let &filetype = s:ft
  wincmd p
  diffthis
endfunction

function! functions#indentation() abort
  if !&modifiable
    return
  endif

  if !exists('b:show_indentation')
    let b:show_indentation = ''
    let tabs = search('^\t', 'nw') != 0
    let spaces = search('^ \{' . &tabstop . ',}[^\t]', 'nw') != 0

    if search('\s\+$', 'nw') != 0
      let b:show_indentation = '[•]'
    endif

    if tabs && spaces
      let b:show_indentation =  '[✘]'
    elseif (spaces && !&expandtab) || (tabs && &expandtab)
      let b:show_indentation = '[&]'
    endif
  endif
  return b:show_indentation
endfunction
