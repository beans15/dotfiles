" Javascript
au BufNewFile,BufRead *.js,*.javascript,*.es  call s:FTjavascript()
" jQuery
func! s:FTjavascript()
  let n = 1
  while n <= line("$")
    if getline(n) =~ '\v(\$|jQuery)[.(]'
      set filetype=jquery
      return
    endif
    let n = n + 1
  endwhile

  set filetype=javascript
endfunc
