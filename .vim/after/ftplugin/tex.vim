noremap <F5> <Esc> :w <Return> :lcd %:h <Return> :!platex % <Return> :!platex % <Return> :!out2uni %<.out <Return> :!platex % <Return> :!dvipdfmx %<.dvi <Return>

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal expandtab
