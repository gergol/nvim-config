return
{
  "gergol/cmake-debugger.nvim",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  opts = {
    cmake_build_dir = function()
      require('plugins.cmake4vim').config()
      return vim.g.cmake_build_dir
    end,
  }
}
