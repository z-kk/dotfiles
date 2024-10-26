inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

noremap ; <C-w>
noremap , "
cnoremap <C-r>, <C-r>"

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<C-o>zR\<Plug>snipMateNextOrTrigger"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<Plug>snipMateBack"

noremap <F12> :LspDefinition <CR>

nnoremap <leader>fn :Fern .<CR>
nnoremap <leader>ff :Fern . -reveal=%<CR>
nnoremap <leader>fd :Fern . -reveal=% -drawer -toggle<CR>

nnoremap <leader>mn :MemoNew<CR>
nnoremap <leader>ml :MemoList<CR>
nnoremap <leader>mg :MemoGrep<CR>
