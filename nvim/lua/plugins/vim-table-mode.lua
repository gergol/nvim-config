return {
  'dhruvasagar/vim-table-mode',
  event = "VeryLazy",
  -- config = function()
  --   vim.cmd([[ let g:table_mode_corner = '+' ]])
  --   vim.cmd([[ let g:table_mode_corner_corner = '+' ]])
  --   vim.cmd([[ let g:table_mode_header_fillchar = '=' ]])
  -- end,
  keys = {
    "<leader>tm", "<cmd>TableModeToggle<cr>", desc = "Table Mode"
  }
}
