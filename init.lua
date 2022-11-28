--    AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

        -- Configure AstroNvim updates
        updater = {
                remote = "origin", -- remote to use
                channel = "nightly", -- "stable" or "nightly"
                version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
                branch = "main", -- branch name (NIGHTLY ONLY)
                commit = nil, -- commit hash (NIGHTLY ONLY)
                pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
                skip_prompts = false, -- skip prompts about breaking changes
                show_changelog = true, -- show the changelog after performing an update
                auto_reload = false, -- automatically reload and sync packer after a successful update
                auto_quit = false, -- automatically quit the current session after a successful update
                -- remotes = { -- easily add new remotes to track
                --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
                --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
                --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
                -- },
        },

        -- Set colorscheme to use
        colorscheme = "default_theme",

        -- Add highlight groups in any theme
        highlights = {
                -- init = { -- this table overrides highlights in all themes
                --   Normal = { bg = "#000000" },
                -- }
                -- duskfox = { -- a table of overrides/changes to the duskfox theme
                --   Normal = { bg = "#000000" },
                -- },
        },

        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = true, -- sets vim.opt.relativenumber
                        number = true, -- sets vim.opt.number
                        spell = false, -- sets vim.opt.spell
                        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                        wrap = false, -- sets vim.opt.wrap
                        tabstop = 4,
                        softtabstop = 4,
                        shiftwidth = 4,
                        expandtab = true,
                        scrolloff = 7,
                        autoindent = true,
                        smartindent = true,
                        -- columns=120
                        linebreak = true,
                },
                g = {
                        mapleader = " ", -- sets vim.g.mapleader
                        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
                        cmp_enabled = true, -- enable completion at start
                        autopairs_enabled = true, -- enable autopairs at start
                        diagnostics_enabled = true, -- enable diagnostics at start
                        status_diagnostics_enabled = true, -- enable diagnostics in statusline
                        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
                        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
                        copilot_no_tab_map = true,
                },
        },
        -- If you need more control, you can use the function()...end notation
        -- options = function(local_vim)
        --   local_vim.opt.relativenumber = true
        --   local_vim.g.mapleader = " "
        --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
        --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
        --
        --   return local_vim
        -- end,

        -- Set dashboard header
        header = {
                " █████  ███████ ████████ ██████   ██████",
                "██   ██ ██   ██    ██   ██ ██    ██",
                "███████ ███████    ██    ██████  ██    ██",
                "██   ██      ██    ██    ██   ██ ██    ██",
                "██   ██ ███████    ██    ██   ██  ██████",
                " ",
                "    ███    ██ ██    ██ ██ ███    ███",
                "    ████   ██ ██    ██ ██ ████  ████",
                "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
                "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
                "    ██   ████   ████   ██ ██      ██",
        },

        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                        fg = "#abb2bf",
                        bg = "#1e222a",
                },
                highlights = function(hl) -- or a function that returns a new table of colors to set
                        local C = require "default_theme.colors"

                        hl.Normal = { fg = C.fg, bg = C.bg }

                        -- New approach instead of diagnostic_style
                        hl.DiagnosticError.italic = true
                        hl.DiagnosticHint.italic = true
                        hl.DiagnosticInfo.italic = true
                        hl.DiagnosticWarn.italic = true

                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = false,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        treesitter = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
        },

        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
        },

        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                formatting = {
                        -- control auto formatting on save
                        format_on_save = {
                                enabled = true, -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        "lua",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
                        },
                        timeout_ms = 1000, -- default format timeout
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- add to the global LSP on_attach function
                -- on_attach = function(client, bufnr)
                -- end,

                -- override the mason server-registration function
                -- server_registration = function(server, opts)
                --   require("lspconfig")[server].setup(opts)
                -- end,

                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        clangd = {
                                cmd = {
                                        -- see clangd --help-hidden
                                        "clangd",
                                        "--background-index",
                                        -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
                                        -- to add more checks, create .clang-tidy file in the root directory
                                        -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
                                        "--clang-tidy",
                                        "--completion-style=bundled",
                                        "--cross-file-rename",
                                        "--header-insertion=iwyu",
                                        "--header-insertion-decorators",
                                        "--pch-storage=memory",
                                        "--suggest-missing-includes",
                                        -- "--malloc-trim",
                                        --    "--all-scopes-completion",
                                        "-j=6",
                                        "--offset-encoding=utf-16",
                                        --    "--log=verbose",
                                        --    "--pretty",
                                },
                                init_options = {
                                        clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
                                        usePlaceholders = true,
                                        completeUnimported = true,
                                        semanticHighlighting = true,
                                },
                                capabilities = {
                                        offsetEncoding = "utf-16",
                                },
                        },
                        -- example for addings schemas to yamlls
                        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
                        --   settings = {
                        --     yaml = {
                        --       schemas = {
                        --   ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                        --   ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                        --   ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                        --       },
                        --     },
                        --   },
                        -- },
                },
        },

        -- Mapping data with "desc" stored directly by vim.keymap.set().
        --
        -- Please use this mappings table to set keyboard mapping since this is the
        -- lower level configuration and more robust one. (which-key will
        -- automatically pick-up stored data by this setting.)
        mappings = {
                -- first key is the mode
                n = {
                        -- second key is the lefthand side of the map
                        ["<leader>ha"] = { function() require("harpoon.mark").add_file() end, desc = "Add file to menu" },
                        ["<leader>hh"] = {
                                function() require("harpoon.ui").toggle_quick_menu() end,
                                desc = "Show pinned files",
                        },
                        ["<leader>hj"] = { function() require("harpoon.ui").nav_file(1) end, desc = "Go to file 1" },
                        ["<leader>hk"] = { function() require("harpoon.ui").nav_file(2) end, desc = "Go to file 2" },
                        ["<leader>hl"] = { function() require("harpoon.ui").nav_file(3) end, desc = "Go to file 3" },
                        ["<leader>h;"] = { function() require("harpoon.ui").nav_file(4) end, desc = "Go to file 4" },
                        ["<leader>h'"] = { function() require("harpoon.ui").nav_file(5) end, desc = "Go to file 5" },
                        -- quick save
                        ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
                        -- next/prev buffer:
                        ["<leader>1"] = { ":BufferLineCyclePrev<cr>", desc = "Prev buffer" },
                        ["<leader>2"] = { ":BufferLineCycleNext<cr>", desc = "Next buffer" },
                        -- clear search higlights with double esc
                        ["<esc><esc>"] = { ":nohlsearch<cr>" },
                        ["<leader>ww"] = { "<esc>:w!<cr>", desc = "Save current buffer" },
                        -- quickfix improvements
                        ["<C-q>"] = {
                                function() require("user.helpers").toggle_qf() end,
                                desc = "Toggle quick fix window",
                        },
                        ["<C-k>"] = { ":cprev<cr>", desc = "Prev QF item" },
                        ["<C-j>"] = { ":cnext<cr>", desc = "Next QF item" },
                        -- Debugger
                        ["<F9>"] = { ":call vimspector#ToggleBreakpoint()<cr>", silent = true, desc = "toggle breakpoint" },
                        ["<S-F9>"] = {
                                ":call vimspector#ToggleConditionalBreakpoint()<cr>",
                                silent = true,
                                desc = "toggle conditional breakpoint",
                        },
                        ["<F10>"] = { ":call vimspector#StepOver()<cr>", silent = true, desc = "Step over" },
                        ["<F5>"] = { ":call vimspector#Continue()<cr>", silent = true, desc = "Continue" },
                        ["<S-F11>"] = { ":call vimspector#StepOut()<cr>", silent = true, desc = "Step out" },
                        ["<F11>"] = { ":call vimspector#StepInto()<cr>", silent = true, desc = "Step into" },
                        ["<C-K>"] = { ":call vimspector#BalloonEval()<cr>", silent = true, desc = "Hover" },
                        ["<leader>dd"] = { ":call vimspector#Launch()<cr>", desc = "Launch debugging" },
                        ["<leader>dc"] = {
                                ":call GotoWindowNoMax(g:vimspector_session_windows.code)<cr>",
                                desc = "Focus code",
                        },
                        ["<leader>dt"] = {
                                ":call GotoWindowNoMax(g:vimspector_session_windows.terminal)<cr>",
                                desc = "Focus terminal",
                        },
                        ["<leader>dv"] = {
                                ":call GotoWindowNoMax(g:vimspector_session_windows.variables)<cr>",
                                desc = "Focus variables",
                        },
                        ["<leader>dw"] = {
                                ":call GotoWindowNoMax(g:vimspector_session_windows.watches)<cr>",
                                desc = "Focus watches",
                        },
                        ["<leader>ds"] = {
                                ":call GotoWindowNoMax(g:vimspector_session_windows.stack_trace)<cr>",
                                desc = "Fockus stack trace",
                        },
                        ["<leader>do"] = {
                                ":call GotoWindowNoMax(g:vimspector_session_windows.output)<cr>",
                                desc = "Focus output",
                        },
                        ["<leader>de"] = { ":call vimspector#Reset()<cr>", desc = "Stop debugging" },
                        -- alternative bindings
                        -- Cmake4Vim
                        ["<leader>bB"] = { ":CMake<cr>", desc = "Create CMake project" },
                        ["<leader>bb"] = { ":CMakeBuild<cr>", desc = "Build CMake project" },
                        ["<leader>bt"] = { ":Telescope cmake4vim select_build_type<cr>", desc = "Select CMake build type" },
                        ["<leader>bT"] = { ":Telescope cmake4vim select_target<cr>", desc = "Select CMake target" },
                        ["<leader>bk"] = { ":Telescope cmake4vim select_kit<cr>", desc = "Select CMake kit" },
                        ["<leader>bC"] = { ":CMakeClean<cr>", desc = "Clean project" },
                        ["<leader>bs"] = { ":CMakeCompileSource<cr>", desc = "Compile current buffer" },
                        ["<leader>br"] = { ":CMakeResetAndReload<cr>", desc = "Reset cmake cache" },
                        ["<leader>bR"] = { ":CMakeReset<cr>", desc = "Reset build folder completely" },
                        ["<leader>bi"] = { ":CMakeInfo<cr>", desc = "Info" },
                        -- Goto header
                        ["gh"] = { "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Jump to header/source" },
                        -- Vim maximizer
                        ["<leader>m"] = { ":MaximizerToggle!<cr>", desc = "Maximize window" },
                        -- Vim fugitive git integration
                        ["<leader>gs"] = { ":G<cr>", desc = "Open git  window" },
                },
                i = {
                        ["<C-J>"] = { "copilot#Accept(<Tab>)", silent = true, expr = true, script = true },
                },
                t = {
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                },
                v = {
                        -- quickfix improvements
                        ["<C-q>"] = {
                                function() require("user.helpers").toggle_qf() end,
                                desc = "Toggle quick fix window",
                        },
                        ["<C-k>"] = { ":cprev<cr>", desc = "Prev QF item" },
                        ["<C-j>"] = { ":cnext<cr>", desc = "Next QF item" },
                },
        },

        -- Configure plugins
        plugins = {
                init = {
                        -- You can disable default plugins as follows:
                        -- ["goolord/alpha-nvim"] = { disable = true },

                        -- You can also add new plugins here as well:
                        -- Add plugins, the packer syntax without the "use"
                        -- { "andweeb/presence.nvim" },
                        -- {
                        --   "ray-x/lsp_signature.nvim",
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },

                        -- We also support a key value style plugin definition similar to NvChad:
                        -- ["ray-x/lsp_signature.nvim"] = {
                        --   event = "BufRead",
                        --   config = function()
                        --     require("lsp_signature").setup()
                        --   end,
                        -- },{
                        {
                                "mfussenegger/nvim-dap",
                                config = function() require("user.nvim-dap").setup() end,
                        },
                        {
                                "p00f/clangd_extensions.nvim",
                                after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
                                config = function()
                                        require("clangd_extensions").setup {
                                                server = astronvim.lsp.server_settings "clangd",
                                        }
                                end,
                        },
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        -- local null_ls = require "null-ls"

                        -- Check supported formatters and linters
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
                        -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.stylua,
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                },
                -- ["max397574/better-escape.nvim"] = {
                --   mapping = { "jk" },
                -- keys = function()
                --   print("AAAAA")
                --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
                -- end,
                -- },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        ensure_installed = { "clangd" },
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                },
        },

        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                vscode = {
                        -- Add paths for including more VS Code style snippets in luasnip
                        paths = {},
                },
        },

        -- CMP Source Priorities
        -- modify here the priorities of default cmp sources
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources:
        -- false == disabled
        -- true == 1000
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                },
        },

        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ["<leader>"] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ["h"] = { name = "Harpoon" },
                                        ["d"] = { name = "Debug" },
                                        ["b"] = { name = "Build" },
                                },
                        },
                },
        },

        -- This function is run last and is a good place to configuring
        -- augroups/autocommands and custom filetypes also this just pure lua so
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                vim.cmd "set path+=**"
                require("telescope").load_extension "cmake4vim"
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
        end,
}

return config
