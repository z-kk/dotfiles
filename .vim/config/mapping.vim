inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

noremap ; <C-w>
noremap , "
cnoremap <C-r>, <C-r>"

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<C-o>zR\<Plug>snipMateNextOrTrigger"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<Plug>snipMateBack"

noremap <F12> :LspDefinition <CR>
noremap <leader>fn :Fern .<CR>
noremap <leader>ff :Fern . -reveal=%<CR>
noremap <leader>fd :Fern . -reveal=% -drawer -toggle<CR>
