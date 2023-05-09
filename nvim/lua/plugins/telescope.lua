return {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    keys = {
       { "<leader>fw", function() require("telescope.builtin").live_grep() end, desc = "Search words"},
       { "<leader>fW",
            function()
                require("telescope.builtin").live_grep {
                    additional_args = function(args) return vim.list_extend(args,
                        { "--hidden", "--no-ignore" })
                    end
                }
            end,
            desc = "Search words in all files",
        },
        -- gt = { function() require("telescope.builtin").git_status() end, desc = "Git status"},
        -- gb = { function() require("telescope.builtin").git_branches() end, desc = "Git branches"},
        -- gc = { function() require("telescope.builtin").git_commits() end, desc = "Git commits"},
       { "<leader>ff", function() require("telescope.builtin").git_files() end, desc = "Search files"},
       { "<leader>fF",
            function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
            desc = "Search all files",
        },
       { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Search buffers"},
       { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Search help"},
       { "<leader>fm", function() require("telescope.builtin").marks() end, desc = "Search marks"},
       { "<leader>fo", function() require("telescope.builtin").oldfiles() end, desc = "Search history"},
       { "<leader>fc", function() require("telescope.builtin").grep_string() end, desc = "Search for word under cursor"},
       { "<leader>fs", function() require('session-lens').search_session() end, desc = "Search sessions"},
    }
}
