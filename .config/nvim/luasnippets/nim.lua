local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

return {
    s("tasks", {
        t({"# Tasks",
            "",
            "import std / [os, strutils]",
            'task r, "build and run":',
            '  exec "nimble build"',
            '  exec "nimble ex"',
            "",
            'task ex, "run without build":',
            "  withDir binDir:",
            '    exec "." / bin[0]',
            "", "",
            "# Before / After",
            "",
            "before build:",
            '  let infoFile = srcDir / bin[0] / "nimbleInfo.nim"',
            "  infoFile.parentDir.mkDir",
            '  infoFile.writeFile("""',
            "    const",
            '      AppName* = "$#"',
            '      Version* = "$#"',
            '  """.dedent % [bin[0], version])',
            "",
            "after build:",
            '  let infoFile = srcDir / bin[0] / "nimbleInfo.nim"',
            '  infoFile.writeFile("""',
            "    const",
            '      AppName* = ""',
            '      Version* = ""',
            '  """.dedent)',
        })
    }),
}
