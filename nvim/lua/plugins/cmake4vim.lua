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
    wk.add({
      { "<leader>b",  group = "Cmake" },
      { "<leader>bB", ":CMake<cr>",                                 desc = "Create CMake project" },
      { "<leader>bC", ":CMakeClean<cr>",                            desc = "Clean project" },
      { "<leader>bR", ":CMakeReset<cr>",                            desc = "Reset build folder completely" },
      { "<leader>bT", ":Telescope cmake4vim select_target<cr>",     desc = "Select CMake target" },
      { "<leader>bb", ":CMakeBuild<cr>",                            desc = "Build CMake project" },
      { "<leader>bi", ":CMakeInfo<cr>",                             desc = "Info" },
      { "<leader>bk", ":Telescope cmake4vim select_kit<cr>",        desc = "Select CMake kit" },
      { "<leader>br", ":CMakeResetAndReload<cr>",                   desc = "Reset cmake cache" },
      { "<leader>bs", ":CMakeCompileSource<cr>",                    desc = "Compile current buffer" },
      { "<leader>bt", ":Telescope cmake4vim select_build_type<cr>", desc = "Select CMake build type" },
    })
  end,
  lazy = true,
  ft = { "cmake", "cpp", "c", "hpp" },
}
