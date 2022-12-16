--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "lunar"

vim.g.python3_host_prog = "$HOME/.virtualenvs/neovim/bin/python"
vim.opt.relativenumber = true
vim.opt.path:append '**'

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-z>"] = "<nop>" -- disable tty ctrl-z suspend to prevent accidentaly closing vim
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["jk"] = "<esc>:w!<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
--
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Fix the awkward telescope defaults...
lvim.builtin.telescope.pickers.find_files.previewer = nil
lvim.builtin.telescope.pickers.find_files.theme = nil
lvim.builtin.telescope.pickers.git_files.previewer = nil
lvim.builtin.telescope.pickers.git_files.theme = nil
lvim.builtin.telescope.pickers.find_files.theme = nil
lvim.builtin.telescope.pickers.live_grep.theme = nil
lvim.builtin.telescope.pickers.grep_string.theme = nil
lvim.builtin.telescope.pickers.buffers.theme = nil
lvim.builtin.telescope.pickers.lsp_references.theme = nil
lvim.builtin.telescope.pickers.lsp_definitions.theme = nil
lvim.builtin.telescope.pickers.lsp_declarations.theme = nil
lvim.builtin.telescope.pickers.lsp_implementations.theme = nil
lvim.builtin.telescope.defaults.path_display = nil -- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

lvim.builtin.which_key.setup.plugins.registers = true
lvim.builtin.which_key.setup.plugins.marks = true
lvim.builtin.which_key.setup.plugins.presets.operators = true
lvim.builtin.which_key.setup.plugins.presets.z = true
lvim.builtin.which_key.setup.plugins.presets.nav = true
lvim.builtin.which_key.setup.plugins.presets.windows = true
lvim.builtin.which_key.setup.plugins.presets.g = true
lvim.builtin.which_key.setup.plugins.presets.text_objects = true
lvim.builtin.which_key.setup.plugins.presets.motions = true
-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

lvim.builtin.which_key.mappings["f"] = {
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
  -- sb = { function() require("telescope.builtin").git_branches() end, "Git branches" },
  -- sh = { function() require("telescope.builtin").help_tags() end, "Search help" },
  -- sm = { function() require("telescope.builtin").man_pages() end, "Search man" },
  -- sr = { function() require("telescope.builtin").registers() end, "Search registers" },
  -- sk = { function() require("telescope.builtin").keymaps() end, "Search keymaps" },
  -- sc = { function() require("telescope.builtin").commands() end, "Search commands" },
}

lvim.builtin.which_key.mappings["b"] = {
  name = "+Cmake",
  B = { ":CMake<cr>", "Create CMake project" },
  b = { ":CMakeBuild<cr>", "Build CMake project" },
  t = { ":Telescope cmake4vim select_build_type<cr>", "Select CMake build type" },
  T = { ":Telescope cmake4vim select_target<cr>", "Select CMake target" },
  k = { ":Telescope cmake4vim select_kit<cr>", "Select CMake kit" },
  C = { ":CMakeClean<cr>", "Clean project" },
  s = { ":CMakeCompileSource<cr>", "Compile current buffer" },
  r = { ":CMakeResetAndReload<cr>", "Reset cmake cache" },
  R = { ":CMakeReset<cr>", "Reset build folder completely" },
  i = { ":CMakeInfo<cr>", "Info" }
}

lvim.builtin.which_key.mappings["l"]["R"] = { "<cmd>Telescope lsp_references<cr>", "Find references" }
lvim.builtin.which_key.vmappings["l"] = {
  name = "+LSP",
  a = { function() vim.lsp.buf.code_action() end, "Code action (Doesnt work yet)" }
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+GoTo",
  t = { function()
    local buf = vim.api.nvim_get_current_buf()
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    if ft == "cpp" then
      vim.cmd([[:execute ':find ' . 'test_' . expand('%:t:r') . '.cpp']])
    end
  end
    , "Test"
  }
}

lvim.builtin.which_key.mappings["d"] = {
  name = "+Debug",
  d = { ":call vimspector#Launch()<cr>", "Launch debugging" },
  c = {
    ":call GotoWindowNoMax(g:vimspector_session_windows.code)<cr>",
    "Focus code",
  },
  t = {
    ":call GotoWindowNoMax(g:vimspector_session_windows.terminal)<cr>",
    "Focus terminal",
  },
  v = {
    ":call GotoWindowNoMax(g:vimspector_session_windows.variables)<cr>",
    "Focus variables",
  },
  w = {
    ":call GotoWindowNoMax(g:vimspector_session_windows.watches)<cr>",
    "Focus watches",
  },
  s = {
    ":call GotoWindowNoMax(g:vimspector_session_windows.stack_trace)<cr>",
    "Fockus stack trace",
  },
  o = {
    ":call GotoWindowNoMax(g:vimspector_session_windows.output)<cr>",
    "Focus output",
  },
  i = {
    "<Plug>VimspectorBalloonEval",
    "Evaluate popup", silent = true,
  },
  e = { ":call vimspector#Reset()<cr>", "Stop debugging" },
}

lvim.builtin.which_key.mappings["h"] = {
  name = "+Harpoon",

  a = { function() require("harpoon.mark").add_file() end, "Add file to menu" },
  h = {
    function() require("harpoon.ui").toggle_quick_menu() end,
    "Show pinned files"
  },
  j = { function() require("harpoon.ui").nav_file(1) end, "Go to file 1" },
  k = { function() require("harpoon.ui").nav_file(2) end, "Go to file 2" },
  l = { function() require("harpoon.ui").nav_file(3) end, "Go to file 3" },
}

lvim.builtin.which_key.mappings["h"][";"] = { function() require("harpoon.ui").nav_file(4) end, "Go to file 4" }
lvim.builtin.which_key.mappings["h"]["'"] = { function() require("harpoon.ui").nav_file(5) end, "Go to file 5" }

lvim.keys.normal_mode["gh"] = "<cmd>ClangdSwitchSourceHeader<cr>"

lvim.builtin.which_key.mappings["1"] = { ":BufferLineCyclePrev<cr>", "Prev buffer" }
lvim.builtin.which_key.mappings["2"] = { ":BufferLineCycleNext<cr>", "Next buffer" }
lvim.builtin.which_key.mappings["m"] = { ":MaximizerToggle!<cr>", "Maximize window" }
-- clear search higlights with double esc
lvim.keys.normal_mode["<esc><esc>"] = ":nohlsearch<cr>"
lvim.keys.normal_mode["<C-q>"] = "<cmd>lua require'user.helpers'.toggle_qf()<cr>"

vim.api.nvim_set_keymap("t", "<esc>", "<C-\\><C-n>", { silent = true, noremap = true })
-- quickfix improvements
-- lvim.keys.normal_mode["<C-q>"] = <cmd>lua require'dap'.toggle_breakpoint()<cr><cmd>lua require'dap'.toggle_breakpoint()<cr<cmd>lua require'dap'.toggle_breakpoint()<cr>>c{
--         function() require("user.helpers").toggle_qf() end,
--          "Toggle quick fix window"
-- }

lvim.keys.normal_mode["<C-k>"] = ":cprev<cr>"
lvim.keys.normal_mode["<C-j>"] = ":cnext<cr>"

-- Debugger

lvim.keys.normal_mode["<F5>"] = ":call vimspector#Continue()<cr>"
lvim.keys.normal_mode["<F4>"] = ":call vimspector#Restart()<cr>"
lvim.keys.normal_mode["<F6>"] = ":call vimspector#Pause()<cr>"
lvim.keys.normal_mode["<F9>"] = ":call vimspector#ToggleBreakpoint()<cr>"
lvim.keys.normal_mode["<S-F9>"] =
":call vimspector#ToggleAdvancedBreakpoint()<cr>"
lvim.keys.normal_mode["<F10>"] = ":call vimspector#StepOver()<cr>"
lvim.keys.normal_mode["<S-F11>"] = ":call vimspector#StepOut()<cr>"
lvim.keys.normal_mode["<F11>"] = ":call vimspector#StepInto()<cr>"
-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.direction = "vertical"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.size = 80
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.lualine.sections.lualine_c = {
  { "cmake4vim",
    prefix = "", -- Text to show befor the actual configuration
    cmake4vim_separator = ">", -- Seperator used between the configuration items
    colored = true, -- Displays filetype icon in color if set to true
  }
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

local ts = lvim.builtin.treesitter
ts.textobjects = {
  select = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
    },
  },
  swap = {
    enable = false,
    -- swap_next = textobj_swap_keymaps,
  },
}
-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
require("lvim.lsp.manager").setup("clangd", {
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
    "--offset-encoding=utf-16"
    --    "--log=verbose",
    --    "--pretty",
  },
  init_options = {
    clangdFileStatus = true, -- Provides information about activity on clangd’s per-file worker thread
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
})
-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Disable builtin dap plugin in favor of vimspector
lvim.builtin.dap.active = false

-- Additional Plugins
lvim.plugins = {
  --     {
  --       "folke/trouble.nvim",
  --       cmd = "TroubleToggle",
  --     },
  -- { 'tpope/vim-dispatch' },
  { 'ThePrimeagen/vim-be-good' },
  { "windwp/nvim-ts-autotag" }, { "tpope/vim-abolish" },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("user.plugins.dress").config()
    end,
    disable = false,
    event = "BufWinEnter",
  },
  -- {
  --     "zbirenbaum/copilot.lua",
  --     event = { "VimEnter" },
  --     config = function()
  --         vim.defer_fn(function()
  --             require("copilot").setup {
  --                 plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
  --             }
  --         end, 100)
  --     end,
  -- },
  -- {
  --     "zbirenbaum/copilot-cmp",
  --     after = { "copilot.lua" },
  --     config = function()
  --         require("copilot_cmp").setup()
  --     end,
  -- },
  { "github/copilot.vim" },
  { "ThePrimeagen/harpoon" },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  {
    "ilyachur/cmake4vim",
    requires = { "SantinoKeupp/telescope-cmake4vim.nvim", "SantinoKeupp/lualine-cmake4vim.nvim" },
    config = function() require("user.plugins.cmake4vim").setup() end,
  },
  { "puremourning/vimspector", setup = function()
    vim.cmd [[
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

" let g:vimspector_enable_mappings = 'HUMAN'

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

fun! GotoWindowNoMax(id)
    call win_gotoid(a:id)
endfun


" Adjust window sizes

let g:vimspector_code_minwidth = 120
let g:vimspector_terminal_maxwidth = 120
let g:vimspector_terminal_minwidth = 20
let g:vimspector_sidebar_width = 100
let g:vimspector_bottombar_height = 40
]]
  end },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--   end,
-- })
