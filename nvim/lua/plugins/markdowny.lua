return {
  'antonk52/markdowny.nvim',
  config = function()
    require('markdowny').setup()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        vim.keymap.set('v', '<leader>mb', ":lua require('markdowny').bold()<cr>", { buffer = 0, desc="Bold" })
        vim.keymap.set('v', '<leader>mi', ":lua require('markdowny').italic()<cr>", { buffer = 0, desc="Italic" })
        vim.keymap.set('v', '<leader>mk', ":lua require('markdowny').link()<cr>", { buffer = 0, desc="Link" })
        vim.keymap.set('v', '<leader>mc', ":lua require('markdowny').code()<cr>", { buffer = 0, desc="Code" })
      end,
    })
  end,
  ft = { 'markdown', 'md' },
}
