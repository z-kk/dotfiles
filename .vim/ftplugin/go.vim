noremap <F4> oif err != nil {<Return>return err<Return>}<Esc>
inoremap <F4> <Return>if err != nil {<Return>return err<Return>}
noremap <F5> <Esc>:wa<Return>:!go run .<Return>
inoremap <F5> <Esc>:wa<Return>:!go run .<Return>

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif
