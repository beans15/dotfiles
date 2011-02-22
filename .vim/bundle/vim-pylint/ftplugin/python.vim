function! CheckByPyLint()
    set lazyredraw
    write
    let old_make_prg = &makeprg
    let old_errorformat = &errorformat
    let &makeprg = 'pylint --rcfile='.$HOME.'/.vim/bundle/vim-pylint/.pylint'
    let &errorformat = '%t: \*%l:%m'
    silent! make! %
    let &makeprg = old_make_prg
    let &errorformat = old_errorformat
    set nolazyredraw
    redraw!
    cw
endfunction

nnoremap ,l :call CheckByPyLint()<CR>
