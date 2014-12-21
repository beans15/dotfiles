let s:save_cpo = &cpo
set cpo&vim

let s:kind = {
  \   "name": "maven_detail",
  \   "action_table": {},
  \   "default_action": "yank_sbt",
  \   "parents": []
  \ }

function! unite#kinds#maven_detail#define()
  return s:kind
endfunction

let s:kind.action_table.yank_sbt = {
  \   "description": "yank as sbt format"
  \ }

function! s:kind.action_table.yank_sbt.func(candidate)
  let raw_data = a:candidate.raw_data
  let text = printf('"%s" %% "%s" %% "%s"', raw_data.g, raw_data.a, raw_data.v)

  if has('clipboard')
    call setreg(v:register, text)
  endif
endfunction

let &cpo = s:save_cpo
