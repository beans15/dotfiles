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

    " xxdを適用する前の状態をundoリストから削除
    call s:ResetUndoList()

    setl filetype=xxd
  endif
endfunction


function! s:XXDWritePre()
  if &binary
    let s:cursor_pos = getpos('.')
    %!xxd -r
  endif
endfunction


function! s:XXDWritePost()
  if &binary
    silent %!xxd -g 1

    call setpos('.', s:cursor_pos)
    setl nomod
  endif
endfunction


function! s:ResetUndoList()
  let list = undotree()['entries']
  let old_undolevels = &undolevels

  if len(list) - 1 == 0
    let &undolevels = -1
  else
    let &undolevels = len(list) - 1
  endif

  exec "normal a \<BS>\<Esc>"
  let &undolevels = old_undolevels
  unlet old_undolevels
endfunction
