local obsidian_root_dir = vim.fn.expand("~") .. "/nextcloud/obsidian/"

local function create_new_note()
  local user_input = vim.fn.input('Enter title: ')
  vim.cmd('ObsidianNew ' .. user_input)
end

local function create_link_note()
  local user_input = vim.fn.input('Enter title (optional): ')
  vim.cmd('ObsidianLinkNew ' .. user_input)
end

local opts =
{
  -- Optional, and for backward compatibility. Setting this will use it as the default workspace
  -- dir = "~/vaults/other",
  -- Optional, list of vault names and paths.
  workspaces = {
    {
      name = "personal",
      path = obsidian_root_dir .. "personal",
    },
    {
      name = "work",
      path = obsidian_root_dir .. "work",
    },
  },

  -- Optional, set to true to use the current directory as a vault; otherwise,
  -- the first workspace is opened by default
  detect_cwd = true,

  -- Optional, if you keep notes in a specific subdirectory of your vault.
  notes_subdir = "notes",

  -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
  -- levels defined by "vim.log.levels.*" or nil, which is equivalent to DEBUG (1).
  log_level = vim.log.levels.DEBUG,

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "notes/dailies",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = "daily_nvim.md"
  },

  -- Optional, completion.
  completion = {
    -- If using nvim-cmp, otherwise set to false
    nvim_cmp = true,
    -- Trigger completion at 2 chars
    min_chars = 2,
    -- Where to put new notes created from completion. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = "current_dir",

    -- Whether to add the output of the node_id_func to new notes in autocompletion.
    -- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
    prepend_note_id = true
  },

  -- Optional, key mappings.
  mappings = {
    -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
  },

  -- Optional, customize how names/IDs for new notes are created.
  note_id_func = function(title)
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub("[^A-Za-z0-9-_+ ]", "")
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    -- return tostring(os.time()) .. "-" .. suffix
    return suffix
  end,

  -- Optional, set to true if you don't want obsidian.nvim to manage frontmatter.
  disable_frontmatter = false,

  -- Optional, alternatively you can customize the frontmatter data.
  note_frontmatter_func = function(note)
    -- This is equivalent to the default frontmatter function.
    local out = {
      crated = os.date("!%Y-%m-%d %H:%M:%S"),
      title = note.id,
      aliases = note.aliases,
      tags = note.tags
    }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,

  -- Optional, for templates (see below).
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {
      weekday_today = function()
        return os.date("%a")
      end,
      date_today_long = function()
        return os.date("%A, %B %d, %Y")
      end,
      yesterday = function()
        return os.date("%Y-%m-%d", os.time() - 86400)
      end,
      tomorrow = function()
        return os.date("%Y-%m-%d", os.time() + 86400)
      end
    }
  },

  -- Optional, customize the backlinks interface.
  backlinks = {
    -- The default height of the backlinks pane.
    height = 10,
    -- Whether or not to wrap lines.
    wrap = true,
  },

  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart({ "open", url }) -- Mac OS
    -- vim.fn.jobstart({"xdg-open", url})  -- linux
  end,

  -- Optional, set to true if you use the Obsidian Advanced URI plugin.
  -- https://github.com/Vinzent03/obsidian-advanced-uri
  use_advanced_uri = false,

  -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
  open_app_foreground = true,

  -- Optional, by default commands like `:ObsidianSearch` will attempt to use
  -- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
  -- first one they find. By setting this option to your preferred
  -- finder you can attempt it first. Note that if the specified finder
  -- is not installed, or if it the command does not support it, the
  -- remaining finders will be attempted in the original order.
  finder = "telescope.nvim",

  -- Optional, sort search results by "path", "modified", "accessed", or "created".
  -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example `:ObsidianQuickSwitch`
  -- will show the notes sorted by latest modified time
  sort_by = "modified",
  sort_reversed = true,

  -- Optional, determines whether to open notes in a horizontal split, a vertical split,
  -- or replacing the current buffer (default)
  -- Accepted values are "current", "hsplit" and "vsplit"
  open_notes_in = "current",

  -- Optional, set the YAML parser to use. The valid options are:
  --  * "native" - uses a pure Lua parser that's fast but potentially misses some edge cases.
  --  * "yq" - uses the command-line tool yq (https://github.com/mikefarah/yq), which is more robust
  --    but much slower and needs to be installed separately.
  -- In general you should be using the native parser unless you run into a bug with it, in which
  -- case you can temporarily switch to the "yq" parser.
  yaml_parser = "native",

}

return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre " .. obsidian_root_dir .. "**/**.md",
    "BufNewFile " .. obsidian_root_dir .. "**/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  config = function()
    require("obsidian").setup(opts)

    local wk = require("which-key")
    wk.register({
      ["o"] = {
        name = "Obsidian",
        ["o"] = { "<cmd>ObsidianOpen<cr>", "Open Obsidian" },
        ["n"] = { create_new_note, "New Note" },
        ["s"] = { "<cmd>ObsidianSearch<cr>", "Search" },
        ["b"] = { "<cmd>ObsidianBacklinks<cr>", "Backlinks" },
        ["f"] = { "<cmd>ObsidianFollowLink<cr>", "Follow Link" },
        ["t"] = { "<cmd>ObsidianToday<cr>", "Todays Daily Note" },
        ["y"] = { "<cmd>ObsidianYesterday<cr>", "Yesterdays Daily Note" },
        ["q"] = { "<cmd>ObsidianQuickSwitch<cr>", "Quick Switch" },
        ["w"] = { "<cmd>ObsidianWorkspace<cr>", "Switch Workspace" },
      },
    }, {
      prefix = "<leader>", mode = "n"
    })

    wk.register({
      ["o"] = {
        name = "Obsidian",
        ["l"] = { create_link_note, "Create Linked Note" },
      },
    }, {
      prefix = "<leader>", mode = "v"
    })
  end,
}
