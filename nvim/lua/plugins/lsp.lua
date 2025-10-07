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
        'cmake', -- for cmake.lua
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
      -- This function will be called by the LspAttach autocommand
      -- client: The LSP client object that has attached.
      -- bufnr: The buffer number the client has attached to.
      local function on_lsp_attach(client, bufnr)
        -- Optional: Print a message to confirm attachment and client name
        -- Inside your on_lsp_attach function:

        local pid_info = client.pid and ('PID: ' .. tostring(client.pid)) or 'PID: N/A'
        -- vim.notify('LSP attached: ' .. client.name .. ' (buffer: ' .. bufnr .. ', ' .. pid_info .. ')', vim.log.levels.INFO, { title = 'LSP' })
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- Enable tag navigation (e.g., :tjump, Ctrl-]) to use LSP
        vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')

        local map = function(mode, lhs, rhs, desc)
          local opts = { buffer = bufnr, silent = true, noremap = true }
          if desc then
            opts.desc = 'LSP: ' .. desc
          end
          vim.keymap.set(mode, lhs, rhs, opts)
        end
        map('n', 'gi', vim.lsp.buf.implementation, 'Goto Implementation')
        map('n', 'K', vim.lsp.buf.hover, 'Hover')
        map('n', '<leader>k', vim.lsp.buf.signature_help, 'Signature Help')
        map('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, 'Add Workspace Folder')
        map('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'Remove Workspace Folder')
        map('n', '<leader>lwl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, 'List Workspace Folders')
        map('n', '<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
        map('n', '<leader>lS', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
        map('n', '<leader>lD', vim.lsp.buf.type_definition, 'Type Definition')
        map('n', '<leader>lr', vim.lsp.buf.rename, 'Rename')
        vim.keymap.set({ 'n', 'v' }, '<leader>la', function()
          vim.cmd 'Lspsaga code_action'
        end, { buffer = bufnr, desc = 'LSP: Code action' })
        -- nmap('<leader>lf', function()
        --   vim.lsp.buf.format { async = true }
        -- end, "Format Buffer")
        map('n', '<leader>lo', '<cmd>AerialToggle!<cr>', 'Symbol Outline')
        -- Signature Help (manual trigger in insert mode)
        if client.supports_method 'textDocument/signatureHelp' then
          map('i', '<C-k>', vim.lsp.buf.signature_help, 'Signature Help')
        end

        -- Document Highlights (highlight symbols under cursor on hold)
        if client.supports_method 'textDocument/documentHighlight' then
          -- Create a unique augroup for this buffer's highlight events
          local highlight_augroup_name = 'LspDocumentHighlights_buf_' .. bufnr
          local highlight_augroup = vim.api.nvim_create_augroup(highlight_augroup_name, { clear = true })

          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = highlight_augroup,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
            desc = 'LSP: Document Highlight',
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            group = highlight_augroup,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
            desc = 'LSP: Clear Document Highlight',
          })
        end

        -- Add any other general LSP configurations or keymaps you want for all servers here
        -- vim.notify(client.name .. ' setup complete for buffer ' .. bufnr, vim.log.levels.DEBUG, { title = 'LSP Attach' })
      end

      -- Create an autocommand group to ensure it can be cleared on re-sourcing the config.
      -- Choose a unique name for your augroup.
      local lsp_attach_augroup = vim.api.nvim_create_augroup('UserLspAttachConfig', { clear = true })

      -- Define the autocommand for the LspAttach event
      vim.api.nvim_create_autocmd('LspAttach', {
        group = lsp_attach_augroup, -- Assign to the created group
        desc = 'Apply global LSP settings and keymaps on LspAttach',
        callback = function(ev)
          -- ev.buf is the buffer number where the LSP client attached
          -- ev.client_id is the ID of the LSP client that attached

          -- Retrieve the client object using its ID
          local client = vim.lsp.get_client_by_id(ev.data.client_id)

          if client then
            -- Call your global on_lsp_attach function, passing the client object and buffer number
            -- Make sure 'on_lsp_attach' is accessible here (e.g., defined in the same file or required)
            on_lsp_attach(client, ev.buf)
          else
            vim.notify('LspAttach: Could not retrieve client for ID ' .. tostring(ev.data.client_id), vim.log.levels.WARN, { title = 'LSP Error' })
          end
        end,
      })

      -- switch betweensource and header
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'c', 'cpp', 'objc', 'objcpp' },
        callback = function()
          vim.keymap.set('n', 'gh', function()
            local clients = vim.lsp.get_active_clients { bufnr = 0, name = 'clangd' }
            if #clients == 0 then
              vim.notify('No clangd LSP client attached to this buffer', vim.log.levels.ERROR)
              return
            end

            local params = { uri = vim.uri_from_bufnr(0) }
            clients[1].request('textDocument/switchSourceHeader', params, function(err, result)
              if err then
                vim.notify('Error switching: ' .. tostring(err), vim.log.levels.ERROR)
                return
              end

              if result then
                vim.cmd('edit ' .. vim.uri_to_fname(result))
              else
                vim.notify('No corresponding file found', vim.log.levels.WARN)
              end
            end, 0)
          end, { buffer = true, desc = 'Switch between source/header' })
        end,
      })
    end,
    -- No explicit config needed here if mason-lspconfig handles the setup calls
    -- and your custom configs are in ~/.config/nvim/lsp/
  },

  -- Other LSP related plugins like nvim-cmp, etc.
}
