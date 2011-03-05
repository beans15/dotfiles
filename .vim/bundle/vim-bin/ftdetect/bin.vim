" バイナリ編集モード
" *.bin もしくは、-bオプション付きで起動すると発動
augroup BinaryXXD
  autocmd!
  autocmd BufReadPost * call s:XXDReadPost()
  autocmd BufWritePre * call s:XXDWritePre()
  autocmd BufWritePost * call s:XXDWritePost()
augroup END


function! s:XXDReadPre()
  setl binary
endfunction


function! s:XXDReadPost()
  if &binary
    silent %!xxd -g 1
    setl filetype=xxd
  endif
endfunction


function! s:XXDWritePre()
  if &binary
    %!xxd -r
  endif
endfunction


function! s:XXDWritePost()
  if &binary
    silent %!xxd -g 1
    setl nomod
  endif
endfunction
