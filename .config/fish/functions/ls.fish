switch (uname)
    case Darwin
        function ls
            command ls -ABGF $argv
        end
    case '*'
        function ls
            command ls -ABF --show-control-chars --color=auto $argv
        end
end
