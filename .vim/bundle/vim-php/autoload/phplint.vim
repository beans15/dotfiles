function! phplint#lint()
  write
  let filename = expand('%')
  let old_errorformat = &errorformat
  let &errorformat = '%m in %f on line %l'
  silent! cex system('php -l '.filename.' 2> /dev/null')
  let &errorformat = old_errorformat
  cw
  let w:quickfix_title = 'php -l '.filename
endfunction
