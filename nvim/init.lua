require 'config.options'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup('plugins', {
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
})

require 'config.keymaps'

-- [[ Configure LSP Servers ]]

-- vim.lsp.enable 'clangd'
-- vim.lsp.enable 'lua_ls'
-- ,'jsonls','marksman','pyright')

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- See `:help telescope.builtin`

-- Diagnostic keymaps

-- nvim-cmp setup
vim.cmd.colorscheme 'catppuccin-mocha'
-- vim.cmd.colorscheme "tokyonight"
-- -- Unstaged changes
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
-- Detect SSH or Docker environment for OSC 52 clipboard
local function needs_osc52()
  return os.getenv 'SSH_TTY' or os.getenv 'SSH_CLIENT' or os.getenv 'SSH_CONNECTION' or os.getenv 'DOCKER_CONTAINER'
end

if needs_osc52() then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy '+',
      ['*'] = require('vim.ui.clipboard.osc52').copy '*',
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste '+',
      ['*'] = require('vim.ui.clipboard.osc52').paste '*',
    },
  }
  vim.opt.clipboard = 'unnamedplus'
end

-- Improve agentic coding with e.g. claude code by automatically reloading buffers
-- 1. Enable autoread so Neovim reloads the file if it hasn't been modified in the buffer
vim.opt.autoread = true

-- 2. Trigger checktime on specific events to catch external changes
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  group = vim.api.nvim_create_augroup('AutoCheckTime', { clear = true }),
  pattern = '*',
  callback = function()
    -- Only check if we are in a normal buffer (not a terminal or command window)
    if vim.fn.getcmdwintype() == '' then
      vim.cmd 'checktime'
    end
  end,
})
-- Create a background timer to check for disk changes every 1000ms
local timer = vim.loop.new_timer()
timer:start(
  1000,
  1000,
  vim.schedule_wrap(function()
    -- Only run checktime if we aren't currently typing or in a special buffer
    if vim.api.nvim_get_mode().mode == 'n' and vim.bo.buftype == '' then
      vim.cmd 'checktime'
    end
  end)
)
-- 3. Optional: Notification when a file is reloaded
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  callback = function()
    vim.notify('File changed on disk. Buffer reloaded!', vim.log.levels.INFO)
  end,
})
--------------------------------------------------------------------------------
