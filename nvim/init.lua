require('config.options')

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
require('lazy').setup("plugins", {
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- get a notification when changes are found
  },
})

require('config.keymaps')

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- See `:help telescope.builtin`

-- Diagnostic keymaps

-- nvim-cmp setup
vim.cmd.colorscheme "catppuccin-mocha"
-- vim.cmd.colorscheme "tokyonight"
-- -- Unstaged changes
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
