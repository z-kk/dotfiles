cabbrev <expr> ds (getcmdtype() ==# ":" && getcmdline() ==# "ds") ? "diffsplit" : "ds"

cabbrev <expr> uf (getcmdtype() ==# ":" && getcmdline() ==# "uf") ? "Unite file" : "uf"
cabbrev <expr> ub (getcmdtype() ==# ":" && getcmdline() ==# "ub") ? "Unite buffer" : "ub"
cabbrev <expr> um (getcmdtype() ==# ":" && getcmdline() ==# "um") ? "Unite menu" : "um"
cabbrev <expr> uo (getcmdtype() ==# ":" && getcmdline() ==# "uo") ? "Unite outline" : "uo"
cabbrev <expr> uoq (getcmdtype() ==# ":" && getcmdline() ==# "uoq") ? "Unite outline -no-quit" : "uoq"
cabbrev <expr> uov (getcmdtype() ==# ":" && getcmdline() ==# "uov") ? "Unite outline -vertical" : "uov"
cabbrev <expr> uovq (getcmdtype() ==# ":" && getcmdline() ==# "uovq") ? "Unite outline -vertical -no-quit" : "uovq"
