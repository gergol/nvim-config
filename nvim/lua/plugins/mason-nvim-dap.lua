return {
  "jay-babu/mason-nvim-dap.nvim",
  event        = "VeryLazy",
  -- cmd          = { "DapInstall", "DapUninstall" },
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  opts         = {
    automatic_installation = true,
    handlers = {
      function(config)
        require('mason-nvim-dap').default_setup(config)
        -- in original vscode/launch.json the codelldb adapter is named lldb, so we need to copy the configuration over.
        local dap = require('dap')
        dap.adapters.lldb = dap.adapters.codelldb

        dap.adapters.cmake = {

          type = 'pipe',
          pipe = '${pipe}',
          executable = {
            command = 'cmake',
            args = { '--debugger', '--debugger-pipe=${pipe}', '.' }
          }
        }

        dap.configurations.cmake = {
          {
            type = "cmake",
            name = "Debug",
            request = "launch",
            program = "${file}",
          },
        }
      end,
    }, -- load default handlers
    ensure_installed = {
      "debugpy",
      "vscode-cpptools",
      "codelldb",
    },
  },
}
