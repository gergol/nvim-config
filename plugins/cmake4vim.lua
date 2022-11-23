return {
    setup = function()
        vim.cmd "let g:cmake_reload_after_save = 1"
        vim.cmd "let g:cmake_compile_commands = 1"
        vim.cmd "let g:cmake_compile_commands_link='.'"
        vim.cmd [[ let g:cmake_kits = {
            \  "gcc": {
            \    "compilers": {
            \      "C": "/usr/bin/gcc",
            \      "CXX": "/usr/bin/g++"
            \    },
            \    "generator": "Ninja"
            \  },
            \  "clang": {
            \    "compilers": {
            \      "C": "/usr/bin/clang",
            \      "CXX": "/usr/bin/clang++"
            \    },
            \    "generator": "Ninja"
            \  }
            \}
            ]]
    end,
}
