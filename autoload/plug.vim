scriptencoding utf-8

function! plug#plug(plug_load) abort
  exec 'packadd'.' '.a:plug_load
endfunction
