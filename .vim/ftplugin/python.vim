" neocomplcacheを無効にする
"NeoComplCacheEnable
"NeoComplCacheCachingBuffer
"NeoComplCacheCachingSyntax
"NeoComplCacheCachingTags

setl tabstop=4
setl shiftwidth=4
setl softtabstop=4
setl expandtab
setl list
" 時々消えることがあるので有効にしておく
setl autoindent
setl tags+=~/.vim/tags/python-tags
" 自動折り返しを有効にする
setl formatoptions=tcq
" 自動折り返しの幅をPEP8に準拠させる
setl tw=79

" :PEP8で現在のバッファのPEPエラーチェックを行う
command! -buffer PEP8 :call ListPep8Errors()

function! ListPep8Errors()
    set lazyredraw
    let old_make_prg = &makeprg
    let &makeprg = 'pep8 --repeat'
    silent! make! %
    let &makeprg = old_make_prg
    set nolazyredraw
    redraw!
    cw
endfunction

" Pydictionの辞書ファイルを設定
"let g:pydiction_location = '~/.vim/pydiction/complete-dict'
