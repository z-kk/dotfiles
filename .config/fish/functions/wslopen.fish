test $IS_WSL
and function wslopen
    set -l args
    for arg in $argv
        set -a args "\"`\""(wslpath -w "$arg")"`\"\""
    end

    powershell.exe -Command start "$args"
end
