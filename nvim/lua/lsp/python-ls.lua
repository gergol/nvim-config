require'lspconfig'.pyright.setup{
   handlers = {
     ["textDocument/publishDiagnostics"] = vim.lsp.with(
       vim.lsp.diagnostic.on_publish_diagnostics, {
         -- Disable virtual_text
         virtual_text = true
       }
     ),
   }
}
