return { -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    require("onedark").setup {
      on_highlights = function(hl, c)
        hl.CursorLine = {
          bg = "#ffffff",
        }
      end,
    }
    vim.cmd.colorscheme 'onedark'
  end,
}
