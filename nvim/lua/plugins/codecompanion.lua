return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",                                                                    -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim",                                                       -- Optional: For using slash commands
    { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } }, -- Optional: For prettier markdown rendering
    -- { "stevearc/dressing.nvim",                    opts = {} },                            -- Optional: Improves `vim.ui.select`
    { 'echasnovski/mini.diff',                     version = '*' },
  },
  opts = {
    display = {
      diff = {
        provider = "mini_diff",
      },
      chat = {
        window = {
          position = "right",
        },
      },
    },
    opts = {
      log_level = "DEBUG",
    },
    strategies = {
      chat = {
        adapter = "qwen25",
      },
      inline = {
        adapter = "qwen25",
      },
    },
    adapters = {
      qwen25 = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          name = "qwen25",
          schema = {
            model = {
              default = "qwen2.5-coder:32b",
            },
          },
        })
      end,
    },
  }
}
