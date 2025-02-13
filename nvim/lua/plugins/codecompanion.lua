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
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            -- url = "http[s]://open_compatible_ai_url", -- optional: default value is ollama url http://127.0.0.1:11434
            -- api_key = "OpenAI_API_KEY",             -- optional: if your endpoint is authenticated
            -- chat_url = "/v1/chat/completions",      -- optional: default value, override if different
          },
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
