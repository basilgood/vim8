scriptencoding utf-8

command! -nargs=+ -complete=file Agrep call Agrep(<q-args>)
command! -nargs=1 AA         call <SID>goto_match(<args>)
command!          Anext      call <SID>goto_match(s:cur_match+1)
command!          Aprev      call <SID>goto_match(s:cur_match-1)
command!          Agrepstop  call s:stop()

" global options:
if !exists('agrep_use_qf')
  let agrep_use_qf = 1
endif
if !exists('agrep_default_flags')
  let agrep_default_flags = '-I'
endif
if !exists('agrep_conceal')
  let agrep_conceal = nr2char(30)
endif

let s:grep_cmd = 'GREP_COLORS="mt=01:sl=:fn=:ln=:se=" grep --color=always --line-buffered -nH'

func! Agrep_status()
  return '[Agrep] *'.(g:agrep_active ? 'Active' : 'Done').'*  '.s:regexp.
        \ '%=%-14{"'.(s:cur_match ? s:cur_match.' of ' : '').s:n_matches.'"}%3p%%'
endfunc

func! Agrep(args)
  let s:regexp = matchstr(a:args, '\v^(-\S+\s*)*\zs(".*"|''.*''|\S*)')
  let [g:agrep_active, s:n_matches, s:cur_match, s:columns] = [1, 0, 0, []]

  let grep_cmd = s:grep_cmd . ' ' . g:agrep_default_flags . ' ' . a:args

  if g:agrep_use_qf
    call setqflist([])
    copen
  endif

  let s:agrep_job = job_start(['/bin/sh', '-c', grep_cmd], {
        \ 'out_cb': 'Agrep_cb', 'close_cb': 'Agrep_close_cb'})
endfunc

func! Agrep_cb(channel, msg)
  let ml = matchlist(a:msg, '\v^([^:]*):(\d*):(.*)')
  if !len(ml) | return | endif

  let sp = split(ml[3], '\V\e[\(01\)\?m\e[K', 1)
  let len = 0
  let is_match = 0
  for s in sp
    if is_match
      let s:n_matches += 1
      if g:agrep_use_qf
        call setqflist([{'filename': ml[1], 'lnum': ml[2], 'col': len+1,
              \ 'text': substitute(join(sp, ''), '^\s\+', '', '')}], 'a')
      else
        call add(s:columns, len+1)
        call s:move_to_buf(s:bufnr)
        call setline(s:n_matches+1, printf('%s:%d: %s', ml[1], ml[2],
              \ substitute(join(sp, g:agrep_conceal), '^\s\+', '', '')))
        call setline(1, printf('Searching... %d results:', s:n_matches))
        call s:back_from_buf()
      endif
    endif
    let len += len(s)
    let is_match = !is_match
  endfor
endfunc

func! Agrep_close_cb(channel)
  " out_cb is still active at this point
  call timer_start(200, 'Agrep_final_close')
endfunc

func! Agrep_final_close(timer)
  if g:agrep_use_qf
    redr
    echo 'Done!'
  endif
  let g:agrep_active = 0
endfunc

func! s:set_qf()
  let qf = []
  for i in range(1, s:n_matches)
    let ml = matchlist(getbufline(s:bufnr, i+1)[0], '\v^([^:]*):(\d*):(.*)')
    call add(qf, {'filename': ml[1], 'lnum': ml[2], 'col': s:columns[i-1],
          \ 'text': substitute(ml[3], g:agrep_conceal, '', 'g')})
  endfor
  call setqflist(qf)
endfunc

func! s:stop()
  call job_stop(s:agrep_job)
endfunc
