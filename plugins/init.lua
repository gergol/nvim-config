return {
  { "ThePrimeagen/harpoon" },

  -- { "petertriho/nvim-scrollbar" },
  {
    "gorbit99/codewindow.nvim",
    config = function()
      local codewindow = require "codewindow"
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  },
  --  Case sensitive search/replace and more...
  { "tpope/vim-abolish" },
  -- Maximize windows
  { "szw/vim-maximizer" },
  -- { "github/copilot.vim" },
  -- clangd extensions
  { "p00f/clangd_extensions.nvim" },
  { "tpope/vim-fugitive" },
  -- {
  --   "mfussenegger/nvim-dap",
  --   opt = true,
  --   event = "BufReadPre",
  --   module = { "dap" },
  --   wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
  --   requires = {
  --     "theHamsta/nvim-dap-virtual-text",
  --     "rcarriga/nvim-dap-ui",
  --     "mfussenegger/nvim-dap-python",
  --     "nvim-telescope/telescope-dap.nvim",
  --   },
  --
  --   config = function() require("user.nvim-dap").setup() end,
  -- },
  { "puremourning/vimspector", config = function() require("user.plugins.vimspector").setup() end },
  -- cmake
  {
    "ilyachur/cmake4vim",
    requires = { "SantinoKeupp/telescope-cmake4vim.nvim", "SantinoKeupp/lualine-cmake4vim.nvim" },
    config = function() require("user.plugins.cmake4vim").setup() end,
  },
  { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end },
  { "onsails/lspkind-nvim" }, -- Enables icons on completions
  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      require("copilot").setup()
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua", "nvim-cmp" },
    module = "copilot_cmp",
    config = function()
      require("copilot_cmp").setup()
      astronvim.add_user_cmp_source "copilot"
    end,
  },
}
