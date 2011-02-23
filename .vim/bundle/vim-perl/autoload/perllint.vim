function! perllint#lint()
  if &modified
    write
  endif

  let filename = expand('%')

  let old_errorformat = &errorformat
  let &errorformat = '%m at %f line %l\.\*'

  silent! cex system('perl -MO=Lint,all '.filename)

  let &errorformat = old_errorformat

  cw
  let w:quickfix_title = 'perl -MO=Lint,all '.filename
endfunction
