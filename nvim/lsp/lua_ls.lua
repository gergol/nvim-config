
return {
  cmd = { "lua-language-server" }, -- or the full path if not in PATH
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yaml", ".git" },
  -- Alternatively, a more specific root_dir function for Lua projects:
  -- root_dir = require('vim.lsp.util').root_pattern(".luarc.json", ".luarc.jsonc", ".git"),

  settings = {
    Lua = {
      -- runtime = {
      --   -- Tell the language server which version of Lua you're using
      --   -- (most likely LuaJIT for Neovim plugins)
      --   version = "LuaJIT",
      --   -- path = { "?.lua", "?/init.lua", "lua/?.lua", "lua/?/init.lua" }, -- Adjust if needed
      -- },
      diagnostics = {
        -- Get the language server to recognize Neovim global variables
        globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins" },
        disable = {
          -- "missing-fields",
        }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Avoid diagnostics from third-party libraries e.g. in pack/
      },
      -- Do not send telemetry data confirming to LuaLS specifications
      telemetry = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace", -- "Replace" or "Both"
      },
      formatting = {
        enable = true, -- if you want lua_ls to handle formatting
        -- Default is stylua, ensure it's installed or configure otherwise
      },
    },
  },
  -- on_attach = function(client, bufnr)
  --   -- LuaLS specific on_attach logic if any.
  --   -- For example, if it had a specific command you wanted to map.
  --   -- The global LspAttach will handle common keymaps.
  --   -- client.server_capabilities.hoverProvider = false -- Example: disable hover if too noisy for Lua
  -- end,
}
