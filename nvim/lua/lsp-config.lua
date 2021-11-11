
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
  handler_opts = {
    border = "rounded"
  }
})

