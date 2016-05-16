nnoremap [unite] <Nop>
nmap     <Leader>u [unite]
nmap     <Space>u [unite]
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new directory/new<CR>
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=files file_mru buffer<CR>
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=files file buffer file_mru file/new<CR>
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=files bookmark<CR>
nnoremap <silent> [unite]t :<C-u>Unite -immediately tab:no-current<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register -no-start-insert register<CR>
nnoremap <silent> [unite]/ :<C-u>Unite -winheight=10 -auto-highlight line<CR>
nnoremap <silent> [unite]* :<C-u>UniteWithCursorWord -no-start-insert -winheight=10 -auto-highlight line<CR>
nnoremap <silent> [unite]s :<C-u>Unite -no-start-insert source<CR>
nnoremap <silent> [unite]p :<C-u>call <SID>unite_project()<CR>
nnoremap <silent> [unite]o :<C-u>Unite -no-quit -vertical -direction=rightbelow -winwidth=30 outline<CR>
nnoremap <silent> [unite]] :<C-u>UniteWithCursorWord -no-start-insert -winheight=10 tag<CR>
nnoremap <silent> [unite]e :<C-u>Unite location_list<CR>

function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))

  execute 'Unite '.opts.' file_rec:'.dir
endfunction

augroup UniteFileType
  autocmd!
  "autocmd FileType vim      nnoremap <silent><buffer> K :<C-u>UniteWithCursorWord help<CR>
  autocmd FileType sh       nnoremap <silent><buffer> K :<C-u>UniteWithCursorWord -default-action=right ref/man<CR>
  autocmd FileType python   nnoremap <silent><buffer> K :<C-u>UniteWithCursorWord -default-action=right ref/pydoc<CR>
  autocmd FileType ruby     nnoremap <silent><buffer> K :<C-u>UniteWithCursorWord -default-action=right ref/refe<CR>
augroup END
