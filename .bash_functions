function plat(){
    platex $1.tex;
    platex $1.tex;
    dvipdfmx $1.dvi
}
function maketexpdf(){
    name=`cut -d . -f 1 <(echo $1)`
    pdfcrop $name.pdf
    mv $name-crop.pdf $name.pdf
    extractbb $name.pdf
}
