return {
  'mfussenegger/nvim-dap',
  init = function()
    print('dap setup')
    require('dap.ext.vscode').load_launchjs(nil, {lldb = {'cpp', 'c'}})
  end
}
