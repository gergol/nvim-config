return {
  -- LSP Configuration and Mason
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup {
        -- You can add default settings here if needed, like:
        -- ui = {
        --   border = "rounded",
        --   icons = {
        --     package_installed = "✓",
        --     package_pending = "➜",
        --     package_uninstalled = "✗"
        --   }
        -- }
      }
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' }, -- nvim-lspconfig is still a dep for mason-lspconfig
    config = function()
      -- Get a list of servers to ensure are installed.
      -- These are the servers you have custom configs for in ~/.config/nvim/lsp/
      local servers_to_install = {
        'lua_ls', -- for lua_ls.lua
        'jsonls', -- for jsonls.lua (might be named vscode_json_ls or json_lsp in Mason)
        'pyright', -- for pyright.lua
        'marksman', -- for marksman.lua
        'clangd', -- for clangd.lua
        -- Add any other LSP servers you use
      }

      require('mason-lspconfig').setup {
        ensure_installed = servers_to_install,
        -- automatic_installation = true, -- You can also set this to true
      }

      -- IMPORTANT: How mason-lspconfig interacts with your custom configs.
      -- By default, mason-lspconfig will call lspconfig.server_name.setup({})
      -- for each server. In Neovim 0.11+, lspconfig itself uses vim.lsp.config(),
      -- which respects Neovim's configuration cascade.
      -- This means your custom configurations in ~/.config/nvim/lsp/<server_name>.lua
      -- will be automatically loaded and will take precedence over or merge with
      -- any defaults that nvim-lspconfig might provide.

      -- You do NOT need to call vim.lsp.enable('server_name') manually for servers
      -- handled by mason-lspconfig here, as it takes care of triggering their setup.

      -- If you wanted more granular control and to PREVENT mason-lspconfig from
      -- calling the default lspconfig setup, you could provide custom handlers,
      -- but with Nvim 0.11's merging, this is often not necessary.
      -- Example of a more manual handler (usually not needed with lsp/*.lua files):
      -- require("mason-lspconfig").setup_handlers({
      --   function(server_name)
      --     -- This function is called for each server name in ensure_installed
      --     -- or when a server is installed via Mason.
      --     -- Here, we just enable it. Neovim will pick up the config from your
      --     -- ~/.config/nvim/lsp/<server_name>.lua file.
      --     vim.lsp.enable(server_name)
      --   end,
      --   -- You could also have a specific handler for a server if needed:
      --   -- ["lua_ls"] = function()
      --   --  vim.lsp.enable('lua_ls')
      --   -- end,
      -- })
    end,
  },
  -- nvim-lspconfig is still a good idea to have, as mason-lspconfig depends on it,
  -- and it provides the core default configurations that your custom lsp/*.lua files merge with.
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason.nvim' }, -- Mason provides the servers
    config = function()
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
          nmap('gi', vim.lsp.buf.implementation, 'Goto Implementation')
          nmap('K', vim.lsp.buf.hover, 'Hover')
          nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Help')
          nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, 'Add Workspace Folder')
          nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'Remove Workspace Folder')
          nmap('<leader>lwl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, 'List Workspace Folders')
          nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
          nmap('<leader>lS', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
          nmap('<leader>lD', vim.lsp.buf.type_definition, 'Type Definition')
          nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
          vim.keymap.set({ 'n', 'v' }, '<leader>la', function()
            vim.cmd 'Lspsaga code_action'
          end, { buffer = ev.buffer, desc = 'LSP: Code action' })
          -- nmap('<leader>lf', function()
          --   vim.lsp.buf.format { async = true }
          -- end, "Format Buffer")
          nmap('<leader>lo', '<cmd>AerialToggle!<cr>', 'Symbol Outline')
        end,
      })
    end,
    -- No explicit config needed here if mason-lspconfig handles the setup calls
    -- and your custom configs are in ~/.config/nvim/lsp/
  },

  -- Other LSP related plugins like nvim-cmp, etc.
}
