syn match spaceError display excludenl "\S\s\+$"ms=s+1
syn match spaceError display excludenl "\s\+$"
syn match spaceError display excludenl " \+\t"me=e-1
hi def link spaceError Error
