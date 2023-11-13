return {
  "ilyachur/cmake4vim",
  dependencies = { "SantinoKeupp/telescope-cmake4vim.nvim", "SantinoKeupp/lualine-cmake4vim.nvim" },
  config = function()
    vim.cmd [[let g:cmake_build_dir="./build"]]
    vim.cmd [[let g:cmake_build_type="Debug"]]
    vim.cmd [[let g:cmake_ctest_args="-j8 --output-on-failure"]]
    vim.cmd "let g:cmake_reload_after_save = 0"
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
    \      "C": "clang",
    \      "CXX": "clang++"
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

    local wk = require("which-key")
    wk.register({
      b = {
        name = "+Cmake",
        B = { ":CMake<cr>", "Create CMake project" },
        b = { ":CMakeBuild<cr>", "Build CMake project" },
        t = { ":Telescope cmake4vim select_build_type<cr>", "Select CMake build type" },
        T = { ":Telescope cmake4vim select_target<cr>", "Select CMake target" },
        k = { ":Telescope cmake4vim select_kit<cr>", "Select CMake kit" },
        C = { ":CMakeClean<cr>", "Clean project" },
        s = { ":CMakeCompileSource<cr>", "Compile current buffer" },
        r = { ":CMakeResetAndReload<cr>", "Reset cmake cache" },
        R = { ":CMakeReset<cr>", "Reset build folder completely" },
        i = { ":CMakeInfo<cr>", "Info" }
      }
    }, { prefix = "<leader>" })
  end,
  lazy = true,
  ft = { "cmake", "cpp", "c", "hpp" },
}
