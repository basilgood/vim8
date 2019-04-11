scriptencoding utf-8

function! functions#plug(plug_load) abort
  exec 'packadd'.' '.a:plug_load
endfunction
