" セーフモードを無効にする
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_edit_action = 'tabopen'

"augroup MyVimFilerSettings
"  autocmd!
"  autocmd FileType vimfiler call <SID>vimfiler_settings()
"augroup END
"
"function! s:vimfiler_settings()
"  nmap <buffer> <Space><Space> <Plug>(vimfiler_toggle_mark_current_line)
"  nmap <buffer> <Space><CR> <Plug>(vimfiler_toggle_mark_current_line)
"endfunction

let g:vimfiler_data_directory = g:cache_dir . 'vimfiler'
