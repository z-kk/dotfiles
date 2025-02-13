function nopen
    for x in (command nnn -p -)
        open "$x"
    end
end
