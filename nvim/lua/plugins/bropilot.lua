return {}
-- return {
--   'meeehdi-dev/bropilot.nvim',
--   event = "VeryLazy",   -- preload model on start
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "j-hui/fidget.nvim",
--   },
--   opts = {
--     model = "starcoder2:3b",
--     prompt = {   -- FIM prompt for starcoder2
--       prefix = "<fim_prefix>",
--       suffix = "<fim_suffix>",
--       middle = "<fim_middle>",
--     },
--     debounce = 500,
--     keymap = {
--       accept_line = "<C-j>",
--     },
--   },
--   config = function(_, opts)
--     require("fidget.progress")
--     require("bropilot").setup(opts)
--   end,
-- }