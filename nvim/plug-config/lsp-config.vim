
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
        update_in_insert = false 
    }
)

-- These lines allow navigating diagnostics with gn and gp instead of having
-- the popups display automatically, which was super annoying.
-- See this thread for info: https://www.reddit.com/r/neovim/comments/megnhx/built_in_lsp_diagnostics_and_eslint_d/gshmeik?utm_source=share&utm_medium=web2x&context=3
vim.api.nvim_set_keymap("n", "gn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
EOF

"autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
