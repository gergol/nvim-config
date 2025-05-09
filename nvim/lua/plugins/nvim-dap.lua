return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- "mfussenegger/nvim-dap-python",
  },
  config = function()
    require('dap.ext.vscode').load_launchjs(nil, { lldb = { 'cpp', 'c' }, python = { 'python' } })
    require('dap').defaults.fallback.exception_breakpoints = { 'uncaught' }
    -- local dap_python = require("dap-python")
    -- -- dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python") -- created seperate venv for debugpy
    -- -- dap_python.setup("python3")
    -- dap_python.setup()
    -- dap_python.test_runner = "pytest"
    -- local dap, dapui = require("dap"), require("dapui")
    -- require('dap').set_exception_breakpoints({ "raised", "uncaught" })
    -- vim.keymap.set("n", "<leader>dn", dap_python.test_method, {})
    -- vim.keymap.set("n", "<leader>df", dap_python.test_class, {})
    -- vim.keymap.set("v", "<leader>dS", dap_python.debug_selection, {})
  end
}
