command! -nargs=0 WS
      \ let _w=winsaveview() <Bar>
      \ let _s=@/ |
      \ %s/\s\+$//e |
      \ let @/=_s|
      \ unlet _s |
      \ call winrestview(_w) |
      \ unlet _w
