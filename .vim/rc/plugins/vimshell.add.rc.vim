nnoremap [vimshell] <Nop>
nmap <Leader>s [vimshell]
nmap <Space>s [vimshell]
nnoremap [vimshell]h :<C-u>exec 'VimShellPop ' . expand('%:p:h')<CR>
nnoremap [vimshell]t :<C-u>exec 'VimShellTab ' . expand('%:p:h')<CR>

nnoremap [vimshell-interactive] <Nop>
nmap <Leader>i [vimshell-interactive]
nmap <Space>i [vimshell-interactive]
nnoremap [vimshell-interactive]py :<C-u>VimShellInteractive --split='belowright vsplit' ipython<CR>
nnoremap [vimshell-interactive]rb :<C-u>VimShellInteractive --split='belowright vsplit' irb<CR>
nnoremap [vimshell-interactive]sc :<C-u>VimShellInteractive --split='belowright vsplit' scala<CR>
nnoremap [vimshell-interactive]sb :<C-u>VimShellInteractive --split='belowright vsplit' sbt<CR>
nnoremap [vimshell-interactive]gh :<C-u>VimShellInteractive --split='belowright vsplit' ghci<CR>
