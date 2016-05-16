function! beans15#init#source_rc(path) abort
  let abspath = resolve(expand('~/.vim/rc/') . a:path)
  execute 'source' fnameescape(abspath)
endfunction
