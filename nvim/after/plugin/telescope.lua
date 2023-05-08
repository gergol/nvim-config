local wk = require("which-key")

wk.register({
    f = {
        name = "+Telescope",
        w = { function() require("telescope.builtin").live_grep() end, "Search words" },
        W = {
            function()
                require("telescope.builtin").live_grep {
                    additional_args = function(args) return vim.list_extend(args,
                        { "--hidden", "--no-ignore" })
                    end
                }
            end,
            "Search words in all files",
        },
        -- gt = { function() require("telescope.builtin").git_status() end, "Git status" },
        -- gb = { function() require("telescope.builtin").git_branches() end, "Git branches" },
        -- gc = { function() require("telescope.builtin").git_commits() end, "Git commits" },
        f = { function() require("telescope.builtin").git_files() end, "Search files" },
        F = {
            function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
            "Search all files",
        },
        b = { function() require("telescope.builtin").buffers() end, "Search buffers" },
        h = { function() require("telescope.builtin").help_tags() end, "Search help" },
        m = { function() require("telescope.builtin").marks() end, "Search marks" },
        o = { function() require("telescope.builtin").oldfiles() end, "Search history" },
        c =
        { function() require("telescope.builtin").grep_string() end, "Search for word under cursor" },
        s = { function() require('session-lens').search_session() end, "Search sessions" },

        -- sb = { function() require("telescope.builtin").git_branches() end, "Git branches" },
        -- sh = { function() require("telescope.builtin").help_tags() end, "Search help" },
        -- sm = { function() require("telescope.builtin").man_pages() end, "Search man" },
        -- sr = { function() require("telescope.builtin").registers() end, "Search registers" },
        -- sk = { function() require("telescope.builtin").keymaps() end, "Search keymaps" },
        -- sc = { function() require("telescope.builtin").commands() end, "Search commands" },
    }
}, { prefix = "<leader>" })

