-- NOTE: This is where your plugins related to LSP can be installed.
--  The configuration is done below. Search for lspconfig to find it below.
return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    -- { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
    'nvimdev/lspsaga.nvim',
  },
  init = function()
    -- vim.lsp.set_log_level("debug")
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
        end
        nmap('gD', vim.lsp.buf.declaration, "Goto Declaration")
        nmap('gd', vim.lsp.buf.definition, "Goto Definition")
        nmap('K', vim.lsp.buf.hover, "Hover")
        nmap('gi', vim.lsp.buf.implementation, "Goto Implementation")
        nmap('<leader>k', vim.lsp.buf.signature_help, "Signature Help")
        nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
        nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
        nmap('<leader>lwl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "List Workspace Folders")
        nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
        nmap('<leader>lS', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
        nmap('<leader>lD', vim.lsp.buf.type_definition, "Type Definition")
        nmap('<leader>lR', "<cmd>Telescope lsp_references<cr>", "List References")
        nmap('<leader>lr', vim.lsp.buf.rename, "Rename")
        vim.keymap.set({ 'n', 'v' }, '<leader>la', function() vim.cmd('Lspsaga code_action') end,
          { buffer = ev.buffer, desc = "LSP: Code action" })
        nmap('gr', vim.lsp.buf.references, "Goto References")
        nmap('<leader>lf', function()
          vim.lsp.buf.format { async = true }
        end, "Format Buffer")
        nmap('<leader>lo', "<cmd>AerialToggle!<cr>", "Symbol Outline")
      end,
    })
    --
    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. They will be passed to
    --  the `settings` field of the server config. You must look up that documentation yourself.
    local servers = {
      clangd = {
        cmd = {
          -- see clangd --help-hidden
          "clangd",
          "--background-index",
          -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
          -- to add more checks, create .clang-tidy file in the root directory
          -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
          "--clang-tidy",
          "--clang-tidy-checks=*",
          "--completion-style=bundled",
          "--cross-file-rename",
          "--header-insertion=iwyu",
          "--header-insertion-decorators",
          "--pch-storage=memory",
          "--suggest-missing-includes",
          -- "--malloc-trim",
          --    "--all-scopes-completion",
          "-j=16",
          "--offset-encoding=utf-16"
          --    "--log=verbose",
          --    "--pretty",
        },
        init_options = {
          clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
          usePlaceholders = true,
          completeUnimported = true,
          semanticHighlighting = true,
        },

      },
      jsonls = {},
      marksman = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- tsserver = {},

      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }

    -- Setup neovim lua configuration
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }


    mason_lspconfig.setup_handlers {
      function(server_name)
        if server_name == 'clangd' then
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            cmd = servers[server_name].cmd,
            init_options = servers[server_name].init_options,
            flags = {
              debounce_text_changes = 1000, -- 1 second debounce time
            }
          }
        else
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          }
        end
      end,
    }
    -- Important: sourcekit-lsp is not installably by mason, so we have to add it after the ensure_installed call
    require('lspconfig').sourcekit.setup {
      cmd = { "xcrun", "sourcekit-lsp" },
      filetypes = { "swift", "objective-c", "objective-cpp" },
    }
  end,
}
