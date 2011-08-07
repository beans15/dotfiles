function! javascriptlint#lint()
  if &modified
    write
  endif

  let filename = expand('%')

  let old_errorformat = &errorformat
  let &errorformat = '%f(%l): \*%m'

  silent! cex system('jsl -process '.filename.' 2> /dev/null')

  let &errorformat = old_errorformat

  cw
  let w:quickfix_title = 'jsl -process '.filename
endfunction
