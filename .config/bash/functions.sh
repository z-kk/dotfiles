function chmod-r() {
    # 対象ディレクトリ以下のディレクトリを755, ファイルを644にする
    if [ -z $1 ]; then
        echo "ディレクトリを指定してください"
        echo "ex) chmod-r hoge/"
        return
    else
        dir=$1
    fi
    if [ ! -e $dir ]; then
        echo "$dir が存在しません"
        return
    fi

    find $dir -type d -exec chmod 755 {} +
    find $dir -type f -exec chmod 644 {} +
}

function wslopen() {
    local args=()
    for arg; do
        args+=("$(wslpath -w "$arg")")
    done

    powershell.exe -Command start "" "${args[@]}"
}

function wslmount() {
    if [ -z $1 ]; then
        echo -n "マウントするドライブ: "
        read TARGET
    else
        TARGET=$1
    fi

    if [ -z $TARGET ]; then
        echo "キャンセル"
        return
    fi

    if [ ! -d /mnt/$TARGET ]; then
        sudo mkdir /mnt/$TARGET
    fi
    sudo mount -t drvfs $TARGET: /mnt/$TARGET
}

function wslshutdown() {
    local args=()
    for arg; do
        if [[ $arg == "-h" ]]; then
            args+=("-s")
        elif [[ $arg == "now" ]]; then
            args+=("-t" "0")
        elif [[ $arg == "-c" ]]; then
            args+=("-a")
        else
            args+=("$arg")
        fi
    done

    shutdown.exe "${args[@]}"
}

function plat() {
    if [[ ! -e $1.tex ]]; then
        return
    fi
    platex $1.tex;
    platex $1.tex;
    dvipdfmx $1.dvi
}
function maketexpdf() {
    name=`cut -d . -f 1 <(echo $1)`
    pdfcrop $name.pdf
    mv $name-crop.pdf $name.pdf
    extractbb $name.pdf
}
