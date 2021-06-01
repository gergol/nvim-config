
" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" Show diagnostic popup when hovering. 
" See https://www.reddit.com/r/neovim/comments/mn7coe/lsp_autoshow_diagnostics_on_hover_in_popup_window/
lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
    }
)
EOF

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
