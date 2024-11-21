test $IS_WSL
and function wslshutdown
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
