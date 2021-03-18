if test -n $IS_WSL
    function open
        set -l args
        for arg in $argv
            set -a args (wslpath -w "$arg")
        end

        cmd.exe /c start \"\" (echo \"$args \" | string trim -c '\"')
    end

    function shutdown
        set -l args
        for arg in $argv
            switch $arg
                case "-h"
                    set -a args "-s"
                case "-c"
                    set -a args "-a"
                case "now"
                    set -a args "-t" "0"
                case '*'
                    set -a args $arg
            end
        end

        shutdown.exe $args
    end
end
