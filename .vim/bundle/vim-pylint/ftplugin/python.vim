function! CheckByPyLint()
    set lazyredraw
    let old_make_prg = &makeprg
    let &makeprg = 'pylint --rcfile='.$HOME.'/.vim/bundle/vim-pylint/.pylint'
    silent! make! %
    let &makeprg = old_make_prg
    set nolazyredraw
    redraw!
    cw
endfunction
