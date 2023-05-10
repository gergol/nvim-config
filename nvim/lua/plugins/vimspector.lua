return {
  "puremourning/vimspector",
  init = function()
    vim.cmd [[
    let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

    " let g:vimspector_enable_mappings = 'HUMAN'

    fun! GotoWindow(id)
        call win_gotoid(a:id)
        MaximizerToggle
    endfun

    fun! GotoWindowNoMax(id)
        call win_gotoid(a:id)
    endfun


    " Adjust window sizes

    let g:vimspector_code_minwidth = 120
    let g:vimspector_terminal_maxwidth = 120
    let g:vimspector_terminal_minwidth = 20
    let g:vimspector_sidebar_width = 100
    let g:vimspector_bottombar_height = 40
    ]]
  end,
  -- keys = {
  --   name = "+Debug",
  --   { '<leader>dd', ":call vimspector#Launch()<cr>",                                       desc = "Launch debugging" },
  --   { '<leader>dc', ":call GotoWindowNoMax(g:vimspector_session_windows.code)<cr>",        desc = "Focus code", },
  --   { '<leader>dt', ":call GotoWindowNoMax(g:vimspector_session_windows.terminal)<cr>",    desc = "Focus terminal", },
  --   { '<leader>dv', ":call GotoWindowNoMax(g:vimspector_session_windows.variables)<cr>",   desc = "Focus variables", },
  --   { '<leader>dw', ":call GotoWindowNoMax(g:vimspector_session_windows.watches)<cr>",     desc = "Focus watches", },
  --   { '<leader>ds', ":call GotoWindowNoMax(g:vimspector_session_windows.stack_trace)<cr>", desc = "Fockus stack trace", },
  --   { '<leader>do', ":call GotoWindowNoMax(g:vimspector_session_windows.output)<cr>",      desc = "Focus output", },
  --   {
  --     '<leader>di',
  --     "<Plug>VimspectorBalloonEval",
  --     desc = "Evaluate popup",
  --     silent = true,
  --   },
    -- { '<leader>de', ":call vimspector#Reset()<cr>",                    desc = "Stop debugging" },
    -- --
    -- { "<F5>",       ":call vimspector#Continue()<cr>",                 desc = "Continue" },
    -- { "<F4>",       ":call vimspector#Restart()<cr>",                  desc = "Restart" },
    -- { "<F6>",       ":call vimspector#Pause()<cr>",                    desc = "Pause" },
    -- { "<F9>",       ":call vimspector#ToggleBreakpoint()<cr>",         desc = "ToggleBreakpoint" },
    -- { "<S-F9>",     ":call vimspector#ToggleAdvancedBreakpoint()<cr>", desc = "ToggleAdvancedBreakpoint" },
    -- { "<F10>",      ":call vimspector#StepOver()<cr>",                 desc = "StepOver" },
    -- { "<S-F11>",    ":call vimspector#StepOut()<cr>",                  desc = "StepOut" },
    -- { "<F11>",      ":call vimspector#StepInto()<cr>",                 desc = "StepInto" },
  -- }
}
