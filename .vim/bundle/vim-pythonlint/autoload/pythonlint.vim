"=============================================================================
" FILE: pythonlint.vim
" AUTHOR: Akitoshi MATONO <a.matono@gmail.com>
"=============================================================================


let s:pylintrc_file = globpath(&rtp, '.pylintrc')
if !empty(s:pylintrc_file)
  let s:pylintrc_file = split(s:pylintrc_file, "\n")[0]
endif


function! pythonlint#pylint()
  if empty(s:pylintrc_file)
    return
  endif

  set lazyredraw
  write
  let old_make_prg = &makeprg
  let old_errorformat = &errorformat
  let &makeprg = 'pylint --rcfile='.s:pylintrc_file
  let &errorformat = '%t: \*%l:%m'
  silent! make! %
  let &makeprg = old_make_prg
  let &errorformat = old_errorformat
  set nolazyredraw
  redraw!
  cw
endfunction


function! pythonlint#pep8()
  set lazyredraw
  write
  let old_make_prg = &makeprg
  let &makeprg = 'pep8 --repeat'
  silent! make! %
  let &makeprg = old_make_prg
  set nolazyredraw
  redraw!
  cw
endfunction
