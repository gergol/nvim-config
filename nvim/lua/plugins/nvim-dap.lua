return {
  'mfussenegger/nvim-dap',
  config = function()
    require('dap.ext.vscode').load_launchjs(nil, { lldb = { 'cpp', 'c' }, python = { 'python' } })
    require('dap').defaults.fallback.exception_breakpoints = { 'uncaught' }
  end
}
