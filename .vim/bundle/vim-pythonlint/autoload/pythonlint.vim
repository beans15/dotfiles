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

  write
  let filename = expand('%')
  let old_errorformat = &errorformat
  let &errorformat = '%t: \*%l:%m'
  silent! cex system('pylint --rcfile='.s:pylintrc_file.' '.filename.' 2> /dev/null')
  let &errorformat = old_errorformat
  cw
  let w:quickfix_title = 'pylint --rcfile='.s:pylintrc_file.' '.filename
endfunction


function! pythonlint#pep8()
  write
  let filename = expand('%')
  silent! cex system('pep8 --repeat '.filename.' 2> /dev/null')
  cw
  let w:quickfix_title = 'pep8 --repeat '.filename
endfunction
