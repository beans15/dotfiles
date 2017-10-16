" インサートモードで開始
let g:unite_enable_start_insert = 1
let g:unite_force_overwrite_statusline = 0

" unite-grepのバックエンドをagに変更
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_max_candidates = 200
endif

let g:unite_data_directory = g:cache_dir . 'unite'

" ソースのカスタマイズ
call unite#custom_source('file_rec', 'matchers', 'matcher_fuzzy')

call unite#set_profile('source/location_list', 'context', {
  \ 'winheight': 10,
  \ 'no_quit': 1
  \ })
