nnoremap <silent> <Leader>ex :<C-u>VimFilerBufferDir -simple -explorer -winwidth=30<CR>
nnoremap <silent> <Space>ex :<C-u>VimFilerBufferDir -simple -explorer -winwidth=30<CR>
nnoremap <silent> <Leader>te :<C-u>exec 'VimFilerTab -simple ' . expand('%:p:h')<CR>
nnoremap <silent> <Space>te :<C-u>exec 'VimFilerTab -simple ' . expand('%:p:h')<CR>
