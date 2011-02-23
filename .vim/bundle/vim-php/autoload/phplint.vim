function! phplint#lint()
  set lazyredraw
  write
  let old_make_prg = &makeprg
  let old_errorformat = &errorformat
  let &makeprg = 'php -l'
  let &errorformat = '%m in %f on line %l'
  silent! make! %
  let &makeprg = old_make_prg
  let &errorformat = old_errorformat
  set nolazyredraw
  redraw!
  cw
endfunction
