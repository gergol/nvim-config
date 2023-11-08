return {
  'mfussenegger/nvim-dap',
  init = function()
    require('dap.ext.vscode').load_launchjs(nil, {lldb = {'cpp', 'c'}})
  end
}
