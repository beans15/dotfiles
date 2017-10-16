function! beans15#init#source_rc(path) abort
  let abspath = resolve(expand('~/.vim/rc/') . a:path)
  if !filereadable(abspath)
    let abspath = resolve(expand('$VIM/vimfiles/rc/') . a:path)
  endif

  execute 'source' fnameescape(abspath)
endfunction
