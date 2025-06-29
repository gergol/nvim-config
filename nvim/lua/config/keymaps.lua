vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<C-z>', '<nop>') -- disable tty ctrl-z suspend to prevent accidentaly closing vim)
vim.keymap.set('n', '<leader>ww', ':w<cr>')
vim.keymap.set('i', 'jk', '<esc>:w!<cr>')
vim.keymap.set('i', 'Jk', '<esc>:w!<cr>')
vim.keymap.set('i', 'JK', '<esc>:w!<cr>')
vim.keymap.set('i', 'jK', '<esc>:w!<cr>')
-- disabe arrow keys
vim.keymap.set('n', '<Up>', '<nop>')
vim.keymap.set('n', '<Down>', '<nop>')
vim.keymap.set('n', '<Left>', '<nop>')
vim.keymap.set('n', '<Right>', '<nop>')

vim.keymap.set('v', '<Up>', '<nop>')
vim.keymap.set('v', '<Down>', '<nop>')
vim.keymap.set('v', '<Left>', '<nop>')
vim.keymap.set('v', '<Right>', '<nop>')

vim.keymap.set('i', '<Up>', '<nop>')
vim.keymap.set('i', '<Down>', '<nop>')
vim.keymap.set('i', '<Left>', '<nop>')
vim.keymap.set('i', '<Right>', '<nop>')

vim.keymap.set('n', '<leader>1', ':BufferLineCyclePrev<cr>', { silent = true })
vim.keymap.set('n', '<leader>2', ':BufferLineCycleNext<cr>', { silent = true })
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '<C-h>', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', { desc = 'Replace word under cursor' })
vim.keymap.set('v', '<C-h>', ':s/\\<<C-r><C-w>\\>//g<Left><Left>', { desc = 'Replace word under cursor' })

vim.keymap.set('n', '<C-s>', 'xi', { desc = 'Replace character under cursor' })

vim.keymap.set('n', '<C-p>', 'gg"_dGp', { desc = 'Delete everything and paste' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<C-k>', ':cprev<cr>')
vim.keymap.set('n', '<C-j>', ':cnext<cr>')

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>D', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

vim.keymap.set('n', '<F4>', function()
  require('dap').run_last()
end)
vim.keymap.set('n', '<F5>', function()
  require('dap').continue()
end)
vim.keymap.set('n', '<F6>', require('dap').pause)
vim.keymap.set('n', '<F9>', require('dap').toggle_breakpoint)
vim.keymap.set('n', '<S-F9>', function()
  -- doesn't seem to be called at all in ubunut terminal, because shift f9 does not get passed to vim
  assert(false)
  require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end)
vim.keymap.set('n', '<F10>', require('dap').step_over)
vim.keymap.set('n', '<S-F11>', require('dap').step_out)
vim.keymap.set('n', '<F11>', require('dap').step_into)

-- vim.keymap.set('n', "gh", "<cmd>ClangdSwitchSourceHeader<cr>")

vim.keymap.set('n', '<leader>T', '<cmd>NeoTreeFocusToggle<cr>')
vim.keymap.set('n', '<leader>t', '<cmd>NeoTreeFocus<cr>')
-- paste in visual mode without overwriting paste register
vim.keymap.set('v', 'p', '"_dP', { silent = true, noremap = true })

vim.keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<cr>')
-- search with visual selection
vim.keymap.set('v', '/', '"fy/\\V<C-R>f<CR>')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

vim.keymap.set('n', '<c-q>', require('misc.toggle_qf').toggle_qf)

vim.keymap.set('n', '<leader>m', ':MaximizerToggle!<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<C-z>', require('zen-mode').toggle)
vim.keymap.set('i', '<C-z>', require('zen-mode').toggle)
vim.keymap.set('v', '<C-z>', require('zen-mode').toggle)

local wk = require 'which-key'

---jump to the window of specified dapui element
---@param element string filetype of the element or 'code_win' for the code window
local function jump_to_element(element)
  local visible_wins = vim.api.nvim_tabpage_list_wins(0)
  local dap_configurations = require('dap').configurations
  for _, win in ipairs(visible_wins) do
    local buf = vim.api.nvim_win_get_buf(win)
    if
      vim.bo[buf].filetype == element
      -- As we do not know the filetype of the code window, we have to check if
      -- we can find a window with a file type that is also in the dap.configurations
      -- We simply assume, that this is the code window
      or element == 'code_win' and dap_configurations[vim.bo[buf].filetype] ~= nil
    then
      vim.api.nvim_set_current_win(win)
      return
    end
  end
  vim.notify(("element '%s' not found"):format(element), vim.log.levels.WARN)
end

wk.add {
  { '<leader>d', group = 'Debug' },
  {
    '<leader>dc',
    function()
      jump_to_element 'code_win'
    end,
    desc = 'Focus code',
  },
  { '<leader>dd', require('dap').continue, desc = 'Start debugging' },
  { '<leader>de', require('dap').disconnect, desc = 'Stop debugging' },
  {
    '<leader>di',
    function()
      require('dapui').eval()
      jump_to_element 'dapui_hover'
    end,
    desc = 'Evaluate Expression',
  },
  {
    '<leader>dl',
    function()
      require('dap.ext.vscode').load_launchjs(nil, { lldb = { 'cpp', 'c' } })
    end,
    desc = 'Load launch.json',
  },
  {
    '<leader>dr',
    function()
      jump_to_element 'dap-repl'
    end,
    desc = 'Focus REPL',
  },

  {
    '<leader>ds',
    function()
      jump_to_element 'dapui_stacks'
    end,
    desc = 'Fockus stack trace',
  },
  {
    '<leader>dt',
    function()
      jump_to_element 'dapui_console'
    end,
    desc = 'Focus console',
  },
  {
    '<leader>dv',
    function()
      jump_to_element 'dapui_scopes'
    end,
    desc = 'Focus variables',
  },
  {
    '<leader>dw',
    function()
      jump_to_element 'dapui_watches'
    end,
    desc = 'Focus watches',
  },
  { '<leader>dj', ':e .vscode/launch.json<cr>', desc = 'Edit .vscode/launch.json' },
}

wk.add {
  { '<leader>cc', group = 'Code Companion' },
  { '<leader>ccc', '<cmd>CodeCompanionChat<cr>', desc = 'Code Companion Chat' },
  { '<leader>cca', '<cmd>CodeCompanionActions<cr>', desc = 'Code Companion Actions' },
}

wk.add {
  { '<leader>f', group = 'Telescope' },
}

wk.add {
  { '<leader>h', group = 'Harpoon' },
}
