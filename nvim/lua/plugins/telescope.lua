return  {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    require('telescope').setup {
      defaults = {
        mappings = {
          n = {
            ["<M-p>"] = require('telescope.actions.layout').toggle_preview,
          },
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<Esc>'] = require('telescope.actions').close,
            ["<C-h>"] = "which_key",
            ["<M-p>"] = require('telescope.actions.layout').toggle_preview,
          },
        },
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
    -- require("which-key").register({
    --   f = {
    --     name = "+Telescope",
    --     w = { function() require("telescope.builtin").live_grep() end, "Search words" },
    --     W = {
    --       function()
    --         require("telescope.builtin").live_grep {
    --           additional_args = function(args) return vim.list_extend(args,
    --             { "--hidden", "--no-ignore" })
    --           end
    --         }
    --       end,
    --       "Search words in all files",
    --     },
    --     -- gt = { function() require("telescope.builtin").git_status() end, "Git status" },
    --     -- gb = { function() require("telescope.builtin").git_branches() end, "Git branches" },
    --     -- gc = { function() require("telescope.builtin").git_commits() end, "Git commits" },
    --     f = { function() require("telescope.builtin").git_files() end, "Search files" },
    --     F = {
    --       function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    --       "Search all files",
    --     },
    --     b = { function() require("telescope.builtin").buffers() end, "Search buffers" },
    --     h = { function() require("telescope.builtin").help_tags() end, "Search help" },
    --     m = { function() require("telescope.builtin").marks() end, "Search marks" },
    --     o = { function() require("telescope.builtin").oldfiles() end, "Search history" },
    --     c =
    --       { function() require("telescope.builtin").grep_string() end, "Search for word under cursor" },
    --     s = { function() require('session-lens').search_session() end, "Search sessions" },
    --
    --     -- sb = { function() require("telescope.builtin").git_branches() end, "Git branches" },
    --     -- sh = { function() require("telescope.builtin").help_tags() end, "Search help" },
    --     -- sm = { function() require("telescope.builtin").man_pages() end, "Search man" },
    --     -- sr = { function() require("telescope.builtin").registers() end, "Search registers" },
    --     -- sk = { function() require("telescope.builtin").keymaps() end, "Search keymaps" },
    --     -- sc = { function() require("telescope.builtin").commands() end, "Search commands" },
    --   }
    -- }, { prefix = "<leader>" })
  end,

  keys = {
    {'<leader>fF', function() require('telescope.builtin').git_files() end, desc = 'Search [G]it [F]iles' },
    {'<leader>ff', function() require('telescope.builtin').find_files() end, desc = '[S]earch [F]iles' },
    {'<leader>fh', function() require('telescope.builtin').help_tags() end, desc = '[S]earch [H]elp' },
    {'<leader>fw', function() require('telescope.builtin').grep_string() end, desc = '[S]earch current [W]ord' },
    {'<leader>fg', function() require('telescope.builtin').live_grep() end, desc = '[S]earch by [G]rep' },
    {'<leader>fd', function() require('telescope.builtin').diagnostics() end, desc = '[S]earch [D]iagnostics' },

    {'<leader>?', function() require('telescope.builtin').oldfiles() end, desc = '[?] Find recently opened files' },
    {'<leader>fb', function() require('telescope.builtin').buffers() end, desc = '[b] Find existing buffers' },
    {'<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' },

    },
  },
}
