

local wk = require("which-key")

wk.register({
    h = {
        name = "+Harpoon",

        a = { function() require("harpoon.mark").add_file() end, "Add file to menu" },
        h = {
            function() require("harpoon.ui").toggle_quick_menu() end,
            "Show pinned files"
        },
        j = { function() require("harpoon.ui").nav_file(1) end, "Go to file 1" },
        k = { function() require("harpoon.ui").nav_file(2) end, "Go to file 2" },
        l = { function() require("harpoon.ui").nav_file(3) end, "Go to file 3" },
        n = { function() require("harpoon.ui").nav_file(4) end, "Go to file 4" },
        m  = { function() require("harpoon.ui").nav_file(5) end, "Go to file 5" }
    }
}, { prefix = "<leader>" })
