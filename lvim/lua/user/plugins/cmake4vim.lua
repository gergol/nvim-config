return {
  setup = function()
    vim.cmd [[let g:cmake_build_dir="./build"]]
    vim.cmd [[let g:cmake_build_type="Debug"]]
    vim.cmd [[let g:cmake_ctest_args="-j8 --output-on-failure"]]
    vim.cmd [[let g:cmake_vimspector_support=1]]
    vim.cmd "let g:cmake_reload_after_save = 1"
    vim.cmd "let g:cmake_compile_commands = 1"
    vim.cmd "let g:cmake_compile_commands_link='.'"
    vim.cmd "let g:cmake_build_executor='term'"
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
            \  },
            \  "apple clang": {
            \    "compilers": {
            \      "C": "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc",
            \      "CXX": "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++"
            \    },
            \    "generator": "Ninja"
            \  }
            \}
            ]]
  end,
}

