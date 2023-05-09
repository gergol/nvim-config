return {

    


    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }, 

    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    },

--    {
--        'VonHeikemen/lsp-zero.nvim',
--        branch = 'v2.x',
--        dependencies = {
--            -- LSP Support
--            {'neovim/nvim-lspconfig'},             -- Required
--            {                                      -- Optional
--            'williamboman/mason.nvim',
--            run = function()
--                pcall(vim.cmd, 'MasonUpdate')
--            end,
--        },
--        {'williamboman/mason-lspconfig.nvim'}, -- Optional
--
--        -- Autocompletion
--        {'hrsh7th/nvim-cmp'},     -- Required
--        {'hrsh7th/cmp-nvim-lsp'}, -- Required
--        {'L3MON4D3/LuaSnip'},     -- Required
--    }
--},
  { 'rose-pine/neovim', name = 'rose-pine' },


   'theprimeagen/harpoon',
   'mbbill/undotree',
   'kdheepak/lazygit.nvim',
}
