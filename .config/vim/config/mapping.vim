inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

noremap ; <C-w>
noremap , "
cnoremap <C-r>, <C-r>"

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<Plug>snipMateNextOrTrigger"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<Plug>snipMateBack"

noremap <F12> :LspDefinition <CR>

nnoremap <leader>fn :Fern .<CR>
nnoremap <leader>ff :Fern . -reveal=%<CR>
nnoremap <leader>fd :Fern . -reveal=% -drawer -toggle<CR>

autocmd FileType * nmap <buffer> gx <Plug>(openbrowser-smart-search)
autocmd FileType * vmap <buffer> gx <Plug>(openbrowser-smart-search)

nnoremap <leader>mn :MemoNew<CR>
nnoremap <leader>ml :MemoList<CR>
nnoremap <leader>mg :MemoGrep<CR>

nnoremap <leader>uf :Unite file<CR>
nnoremap <leader>ub :Unite buffer<CR>
nnoremap <leader>um :Unite menu<CR>
nnoremap <leader>uo :Unite outline<CR>
