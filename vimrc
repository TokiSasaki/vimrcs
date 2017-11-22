scriptencoding utf-8

let g:vimrcspath='~/Work/vimrcs'
exe ":set runtimepath+=" . g:vimrcspath

for s:path in split(glob(g:vimrcspath.'/plugins/*'), '\n')
  if s:path !~# '\~$' && isdirectory(s:path)
    let &runtimepath = &runtimepath.','.s:path
  end
endfor
unlet s:path

