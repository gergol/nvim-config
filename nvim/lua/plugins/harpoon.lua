return {
  'theprimeagen/harpoon',
  keys = {

    { '<leader>ha', function() require("harpoon.mark").add_file() end,        desc = "Add file to menu" },
    { '<leader>hh', function() require("harpoon.ui").toggle_quick_menu() end, desc = "Show pinned files" },
    { '<leader>hj', function() require("harpoon.ui").nav_file(1) end,         desc = "Go to file 1" },
    { '<leader>hk', function() require("harpoon.ui").nav_file(2) end,         desc = "Go to file 2" },
    { '<leader>hl', function() require("harpoon.ui").nav_file(3) end,         desc = "Go to file 3" },
    { '<leader>h;', function() require("harpoon.ui").nav_file(4) end,         desc = "Go to file 4" },
    { '<leader>h', function() require("harpoon.ui").nav_file(5) end,         desc = "Go to file 5" },
  }
}
