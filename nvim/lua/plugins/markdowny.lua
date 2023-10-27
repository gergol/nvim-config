return {
  'antonk52/markdowny.nvim',
  config = function()
    require('markdowny').setup()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        local wk = require('which-key')
        wk.register({
          m = {
            name = "+Markdown",
            p = { ":MarkdownPreviewToggle<cr>", "Preview markdown on/off", mode = "n" },
            b = { ":lua require('markdowny').bold()<cr>", "Bold", mode = "v" },
            i = { ":lua require('markdowny').italic()<cr>", "Italic", mode = "v" },
            k = { ":lua require('markdowny').link()<cr>", "Link", mode = "v" },
            c = { ":lua require('markdowny').code()<cr>", "Code", mode = "v" },

          }
        }, { prefix = "<leader>", buffer = 0, mode = {'n', 'v'} })
        -- vim.keymap.set('v', '<leader>mb', ":lua require('markdowny').bold()<cr>", { buffer = 0, desc="Bold" })
        -- vim.keymap.set('v', '<leader>mi', ":lua require('markdowny').italic()<cr>", { buffer = 0, desc="Italic" })
        -- vim.keymap.set('v', '<leader>mk', ":lua require('markdowny').link()<cr>", { buffer = 0, desc="Link" })
        -- vim.keymap.set('v', '<leader>mc', ":lua require('markdowny').code()<cr>", { buffer = 0, desc="Code" })
      end,
    })
  end,
  ft = { 'markdown', 'md' },
}
