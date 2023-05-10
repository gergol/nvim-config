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
    { 'j-hui/fidget.nvim',       opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  init = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<leader>lwl', function()
          print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
        end, opts)
        vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>lR', "<cmd>Telescope lsp_references<cr>", opts)
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>lf', function()
          vim.lsp.buf.format { async = true }
        end, opts)
      end,
    })



    -- LSP settings.
    --  This function gets run when an LSP connects to a particular buffer.
    -- local on_attach = function(_, bufnr)
    --   -- NOTE: Remember that lua is a real programming language, and as such it is possible
    --   -- to define small helper and utility functions so you don't have to repeat yourself
    --   -- many times.
    --   --
    --   -- In this case, we create a function that lets us more easily define mappings specific
    --   -- for LSP related items. It sets the mode, buffer and description for us each time.
    --   local nmap = function(keys, func, desc)
    --     if desc then
    --       desc = 'LSP: ' .. desc
    --     end
    --
    --     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    --   end
    --
    -- --   nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    -- --   nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    -- --
    -- --   nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    -- --   nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    -- --   nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    -- --   nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    -- --   nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    -- --   nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    -- --
    -- --   -- See `:help K` for why this keymap
    -- --   nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    -- --   nmap('<leader>lk', vim.lsp.buf.signature_help, 'Signature Documentation')
    -- --
    -- --   -- Lesser used LSP functionality
    -- --   nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    -- --   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    -- --   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    -- --   nmap('<leader>wl', function()
    -- --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- --   end, '[W]orkspace [L]ist Folders')
    -- --
    -- --   -- Create a command `:Format` local to the LSP buffer
    -- --   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    -- --     vim.lsp.buf.format()
    -- --   end, { desc = 'Format current buffer with LSP' })
    -- end

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
          "--completion-style=bundled",
          "--cross-file-rename",
          "--header-insertion=iwyu",
          "--header-insertion-decorators",
          "--pch-storage=memory",
          "--suggest-missing-includes",
          -- "--malloc-trim",
          --    "--all-scopes-completion",
          "-j=6",
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
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
        }
      end,
    }
  end,
}
