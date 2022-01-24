require("aerial").setup({
  on_attach = function(bufnr)
    -- Toggle the aerial window with <leader>a
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle<CR>', {})
    -- Jump forwards/backwards with '{' and '}'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
    -- Jump up the tree with '[[' or ']]'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
  end
})

local nvim_lsp = require('lspconfig')
local shared = require('lsp.shared')
--local default = shared.default_conf
local default = {

    on_attach = shared.on_attach,
    flags = shared.flags,
    handlers = shared.handlers,
}


local servers = { 
  pyright = default,
  rust_analyzer = default,
  tsserver = default,
  jsonls = default,
  cmake = default,
  clangd = require("lsp.clangd-ls"),
}


for server, config in pairs(servers) do
  nvim_lsp[server].setup(config)
end


require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  use_lspsaga = true,
  floating_window_above_cur_line = false,
  handler_opts = {
    border = "rounded"
  }
})

