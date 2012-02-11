setl cursorline

" Unite内でのキーマッピング
nmap <buffer><expr> <Leader>v unite#do_action('left')
nmap <buffer><expr> <Leader>V unite#do_action('right')
nmap <buffer><expr> <Leader>s unite#do_action('above')
nmap <buffer><expr> <Leader>S unite#do_action('below')
nmap <buffer><expr> <Leader>h unite#do_action('above')
nmap <buffer><expr> <Leader>H unite#do_action('below')

imap <buffer><expr> <C-v> unite#do_action('left')
imap <buffer><expr> <C-s> unite#do_action('above')
imap <buffer><expr> <C-h> unite#do_action('above')
imap <buffer><expr> <C-t> unite#do_action('tabopen')

imap <buffer> <ESC><ESC> <Plug>(unite_exit)
nmap <buffer> <ESC><ESC> <Plug>(unite_exit)
