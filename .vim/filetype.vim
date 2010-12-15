" TeX
au BufNewFile,BufRead *.tex,*.latex,*.sty,*.dtx,*.ltx,*.bbl	setf tex

" Javascript
au BufNewFile,BufRead *.js,*.javascript,*.es  call s:FTjavascript()
" jQuery
func! s:FTjavascript()
  let n = 1
  while n < line("$")
    if getline(n) =~ '\v(\$|jQuery)[.(]'
      setf jquery
      return
    endif
    let n = n + 1
  endwhile

  setf javascript
endfunc

" JSON
au BufNewFile,BufRead *.json setf json
