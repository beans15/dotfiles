"=============================================================================
" File: filetype_tags.vim
" Description: load tag files corresponding to filetype
"

if exists("g:loaded_filetype_tags")
  finish
endif
let g:loaded_filetype_tags = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists("g:tags_dir")
  let g:tags_dir = $HOME."/.tags"
endif

let g:tags_cache = {}

function! s:get_tag_files(filetype)
  if a:filetype != ""
    if has_key(g:tags_cache, a:filetype)
      return eval('g:tags_cache["'.a:filetype.'"]')
    else
      let files = split(expand(g:tags_dir."/".a:filetype."*"), "\n")
      let tag_files = []
      for f in files
        if filereadable(f)
          let tag_files = add(tag_files, f)
        else
          for sub in split(expand(f."/*"))
            let tag_files = add(tag_files, sub)
          endfor
        endif
      endfor

      exec 'let g:tags_cache["'.a:filetype.'"] = tag_files'

      return tag_files
    endif
  else
    return []
  endif
endfunction

function! s:set_tags()
  let &l:tags = &tags.",".join(s:get_tag_files(&ft), ",")
endfunction

autocmd BufRead,BufNewFile * call s:set_tags()

let &cpo = s:save_cpo
unlet s:save_cpo
