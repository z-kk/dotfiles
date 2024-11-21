function wslmount
    set -l target
    test $argv[1]
    and set target $argv[1]
    or read -p'echo "マウントするドライブ: "' target

    if test -z $target
        echo "キャンセル"
        return
    end

    test -d /mnt/$target
    or sudo mkdir /mnt/$target

    sudo mount -t drvfs $target: /mnt/$target
end
