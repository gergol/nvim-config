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
