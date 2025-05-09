return {
  -- Your command-line arguments for clangd
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    -- "--clang-tidy-checks=*", -- Consider managing more granular checks via a .clang-tidy file
    '--completion-style=bundled',
    '--cross-file-rename',
    '--header-insertion=iwyu',
    '--header-insertion-decorators',
    '--pch-storage=memory',
    '--suggest-missing-includes',
    -- "--malloc-trim", -- Uncomment if needed
    -- "--all-scopes-completion", -- Uncomment if needed
    '-j=16',
    '--offset-encoding=utf-16', -- This is generally the default and recommended for LSP
    -- "--log=verbose", -- Uncomment for debugging clangd issues
    -- "--pretty", -- Uncomment for pretty-printed (JSON) logging, if verbose log is enabled
  },

  -- Filetypes that clangd should attach to
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'zig' }, -- Added zig as clangd now supports it

  -- How Neovim discovers the root of your project
  -- clangd primarily uses compile_commands.json
  root_markers = {
    'compile_commands.json',
    '.clangd',
    '.clang-tidy',
    '.git', -- Fallback to git root
  },

  -- Initialization options sent to clangd
  -- These are specific to the clangd server
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
    -- fallbackFlags = {"-std=c++17"}, -- Example: if compile_commands.json is missing
    -- hiddenFeatures = true, -- If you want to enable any features hidden by default
  },

  -- Capabilities: what features Neovim tells clangd it supports.
  -- If you use nvim-cmp for completion, you might get capabilities from there.
  -- For a purely native setup, Neovim's defaults are usually fine.
  -- If you were using nvim-cmp, it might look like this (ensure nvim-cmp and cmp-nvim-lsp are set up):
  -- capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
}
