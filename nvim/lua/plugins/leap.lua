return {
  url = "https://codeberg.org/andyg/leap.nvim",
  config = function()
    -- Sneak-style default mappings (replaces deprecated add_default_mappings())
    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
    vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
    vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
  end,
  dependencies = {
    "tpope/vim-repeat",
  },
  lazy = false,
}
