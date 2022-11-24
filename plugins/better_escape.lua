return {
  mapping = { "jk" },
    keys = function()
      -- save when leaving insert mode with shortcut
      return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l<cmd>w!<cr>' or '<esc><cmd>w!<cr>'
    end,
}
