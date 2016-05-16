nnoremap  [git]     <Nop>
nmap      <Space>g  [git]
nnoremap  <silent>  [git]v        :<C-u>Gitv<CR>
nnoremap  <silent>  [git]V        :<C-u>Gitv!<CR>

augroup MyGitvSettings
  autocmd!
  autocmd FileType gitv call s:my_gitv_settings()
  autocmd FileType git setl foldenable foldlevel=0
  autocmd FileType git nnoremap <silent><buffer> <C-T> :<C-u>windo call <SID>toggle_git_folding()<CR>1<C-w>w
augroup END

function! s:my_gitv_settings()
  setl iskeyword+=/,-,.
  nnoremap <silent><buffer> C :<C-u>Git checkout <C-r><C-w><CR>
  nnoremap <buffer> [git]rb :<C-u>Git rebase <C-r>=GitvGetCurrentHash()<CR><Space>
  nnoremap <buffer> [git]rv :<C-u>Git revert <C-r>=GitvGetCurrentHash()<CR><CR>
  nnoremap <buffer> [git]cp :<C-u>Git cherry-pick <C-r>=GitvGetCurrentHash()<CR><CR>
  "nnoremap <buffer> <Space>grh :<C-u>Git reset --hard <C-r>=GitvGetCurrentHash()<CR>
endfunction

function! s:gitv_get_current_hash()
  return matchstr(getline('.'), '\[\zs.\{7\}\ze\]$')
endfunction

function! s:toggle_git_folding()
  if &filetype ==# 'git'
    setlocal foldenable!
  endif
endfunction
