if command -v pipenv
    function pipython
        pipenv run python $argv
    end
end
