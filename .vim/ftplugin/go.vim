noremap <F4> oif err != nil {<CR>return err<CR>}<Esc>
inoremap <F4> <CR>if err != nil {<CR>return err<CR>}
noremap <F5> <Esc>:wa<CR>:!go run .<CR>
inoremap <F5> <Esc>:wa<CR>:!go run .<CR>

if executable('gopls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'gopls',
    \ 'cmd': {server_info->['gopls']},
    \ 'whitelist': ['go'],
    \ })
  autocmd BufWritePre *.go LspDocumentFormatSync
endif
