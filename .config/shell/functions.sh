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

function removepath() {
    # PATHから引数を含むパスを削除
    if [ -z "$1" ]; then
        return
    fi

    export PATH=$(echo -n $PATH | tr ":" "\n" | grep -v "$1" | tr "\n" ":" | sed "s/:$//")
}

function git_latest_ver() {
    # GitHubから最新リリースバージョンを取得
    local REPO
    if [ $# -eq 1 ]; then
        REPO=$1
    elif [ $# -eq 2 ]; then
        REPO=$1/$2
    fi
    echo $(curl -s https://api.github.com/repos/$REPO/releases/latest | jq -r .tag_name)
}

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

function n() {
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}

LF='
'
function nopen() {
    local IFS=$LF
    for x in $(command nnn -p -); do
        open "$x"
    done
}

function ndocker() {
    echo -n "docker compose command [up]: "
    if [[ $(ps -o cmd= -p $$) =~ "zsh" ]]; then
        read -A readcmd
    else
        read readcmd
    fi
    local cmd=()
    for c in $readcmd; do
        cmd+=($c)
    done
    # default: docker compose up -d
    if [ -z $cmd ]; then
        cmd=("up" "-d")
    fi

    # check $HOME/docker dir exists
    local dir="$HOME/docker"
    if [ ! -d "$dir" ]; then
        dir=""
    fi

    local IFS=$LF
    for x in $(command nnn -p - "$dir"); do
        if [ -d "$x" ]; then
            x="$x"/$(command ls "$x" | grep docker-compose)
        fi
        if [[ ! "$x" =~ "docker-compose" ]]; then
            continue
        fi
        docker compose -f "$x" ${cmd[@]}
    done
}

function wslopen() {
    local args=()
    for arg; do
        args+=("\"\`\"$(wslpath -w "$arg")\`\"\"")
    done

    powershell.exe -Command start "${args[@]}"
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

function catpdf() {
    local args=()
    for c in {A..Z}; do
        if [ -z "$1" ]; then
            echo "Not contains \"cat\"" >&2
            return
        fi
        if [ "$1" = "cat" ]; then
            break
        fi
        args+=("$c=$1")
        shift
    done

    local cmd=""
    local setoutput=0
    while [ ! -z "$1" ]; do
        if [ "$1" = "output" ]; then
            setoutput=1
        fi
        cmd="$cmd $1"
        shift
    done
    if [ $setoutput -eq 0 ]; then
        cmd="$cmd output out.pdf"
    fi

    pdftk "${args[@]}" $cmd
}
