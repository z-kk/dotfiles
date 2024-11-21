switch (uname)
    case Darwin
        function grep
            command grep --color $argv
        end
    case '*'
        function grep
            command grep --color=auto $argv
        end
end
