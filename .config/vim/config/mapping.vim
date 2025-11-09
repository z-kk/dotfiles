inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

noremap ; <C-w>
noremap , "
cnoremap <C-r>, <C-r>"

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<Plug>snipMateNextOrTrigger"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<Plug>snipMateBack"

" Git
noremap <leader>g :Git<CR>

" Memolist
nnoremap <leader>mn :MemoNew<CR>
nnoremap <leader>ml :MemoList<CR>
nnoremap <leader>mg :MemoGrep<CR>

" Fern
nnoremap <leader>fn :Fern .<CR>
nnoremap <leader>ff :Fern . -reveal=%<CR>
nnoremap <leader>fd :Fern . -reveal=% -drawer -toggle<CR>
nnoremap <leader>fh :Fern %:h -reveal=%<CR>
nnoremap <leader>fb :Fern bookmark:///<CR>
autocmd FileType fern nmap <buffer> p P
autocmd FileType fern nmap <buffer> Y C
autocmd FileType fern nmap <buffer> o y:!open '<C-r>"'<CR><CR>
autocmd FileType fern nmap <buffer> [ <Plug>(fern-action-cd:root)
autocmd FileType fern nmap <buffer> ] <Plug>(fern-action-cd:cursor)
autocmd FileType fern nmap <buffer> fp <Plug>(fern-action-preview:auto:enable)<Plug>(fern-action-preview:open)
autocmd FileType fern nmap <buffer> fq <Plug>(fern-action-preview:auto:disable)<Plug>(fern-action-preview:close)

nnoremap <leader>y :Yazi<CR>

" Org
nnoremap <leader>eo :edit $XDG_DATA_HOME/org<CR>

noremap <F12> :LspDefinition <CR>
noremap gd :LspDefinition <CR>

autocmd FileType * nmap <buffer> gx <Plug>(openbrowser-smart-search)
autocmd FileType * vmap <buffer> gx <Plug>(openbrowser-smart-search)

nnoremap <leader>uf :Unite file<CR>
nnoremap <leader>ub :Unite buffer<CR>
nnoremap <leader>um :Unite menu<CR>
nnoremap <leader>uo :Unite outline<CR>
