return {
  lsp = {
    skip_setup = { "clangd" },
    ["server-settings"] = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-16",
        },
      },
    },
  },
  plugins = {
    init = {
      {
        "p00f/clangd_extensions.nvim",
        after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
        config = function()
          require("clangd_extensions").setup {
            server = astronvim.lsp.server_settings "clangd",
          }
        end,
      },
    },
    ["mason-lspconfig"] = {
      ensure_installed = { "clangd" },
    },
  },
}
