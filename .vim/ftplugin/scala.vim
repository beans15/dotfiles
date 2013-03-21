setl tabstop=2
setl shiftwidth=2
setl softtabstop=2

if !exists('g:neocomplcache_dictionary_filetype_lists')
    let g:neocomplcache_dictionary_filetype_lists= {}
endif
let g:neocomplcache_dictionary_filetype_lists['scala'] = $HOME.'/.vim/dict/scala.dict'

if !exists('g:neocomplcache_include_patterns')
    let g:neocomplcache_include_patterns= {}
endif
let g:neocomplcache_include_patterns['scala'] = '^import'

filetype indent off
