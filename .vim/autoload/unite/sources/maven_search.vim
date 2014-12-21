let s:save_cpo = &cpo
set cpo&vim

let s:max_candidates = 50

let s:source = {
  \   "name": "maven_search",
  \   "description": "Search for Maven Repository",
  \   "max_candidates": s:max_candidates,
  \   "action_table": {},
  \ }

function! unite#sources#maven_search#define()
  return s:source
endfunction

function! unite#sources#maven_search#search(word)
  let url = ""
  if type(a:word) == type({}) && has_key(a:word, "g") && has_key(a:word, "a")
    let query = printf('g:"%s"+AND+a:"%s"', a:word.g, a:word.a)
    let url = "http://search.maven.org/solrsearch/select?q=".query."&core=gav&rows=".s:max_candidates."&wt=json"
  else
    let url = "http://search.maven.org/solrsearch/select?q=".a:word."&rows=".s:max_candidates."&wt=json"
  endif
  let res = webapi#http#get(url)

  if res.content == ""
    throw "Getting search results failed. Please try again."
  endif

  let content = webapi#json#decode(res.content)
  return content["response"]["docs"]
endfunction

function! s:source.gather_candidates(args, context)
  if has_key(a:context, "source__selected")
    let l:word = a:context.source__selected
    let l:kind = "maven_detail"

    call unite#print_message('Searching versions for "'.a:context.source__selected.id.'"...')
  else
    if empty(a:args)
      let l:word = unite#util#input("Please input search word: ")
    else
      let l:word = join(a:args, "+")
    endif

    let l:kind = "maven_artifact"

    call unite#print_message('Searching artifacts for "'.l:word.'"...')
  endif

  let docs = unite#sources#maven_search#search(l:word)

  let candidates = []
  for doc in docs
    let candidate = {
      \   "word": doc.id,
      \   "abbr": doc.id,
      \   "kind": l:kind,
      \   "raw_data": doc
      \ }
    call add(candidates, candidate)
  endfor

  return candidates
endfunction

let &cpo = s:save_cpo
