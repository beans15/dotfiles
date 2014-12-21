let s:save_cpo = &cpo
set cpo&vim

let s:kind = {
  \   "name": "maven_artifact",
  \   "action_table": {},
  \   "default_action": "open",
  \   "parents": []
  \ }

function! unite#kinds#maven_artifact#define()
  return s:kind
endfunction

function! unite#kinds#maven_artifact#make_query(group_id, artifact_id)
  return printf('g:"%s"+AND+a:"%s"', a:group_id, a:artifact_id)
endfunction

let s:kind.action_table.open = {
  \   "description": "show versions"
  \ }

function! s:kind.action_table.open.func(candidate)
  let raw_data = a:candidate.raw_data
  let query = unite#kinds#maven_artifact#make_query(raw_data.g, raw_data.a)
  call unite#start(["maven_search"], { "source__selected": raw_data })
endfunction

let &cpo = s:save_cpo
