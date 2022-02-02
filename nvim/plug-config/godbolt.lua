require("godbolt").setup({
    c = { compiler = "cg112", options = {} },
    cpp = { compiler = "g112", options = { userArguments = "-std=c++20 -Wall -O2 " } },
    rust = { compiler = "r1560", options = {} },
    -- any_additional_filetype = { compiler = ..., options = ... },
    quickfix = {
        enable = true, -- whether to populate the quickfix list in case of errors
        auto_open = true -- whether to open the quickfix list if the compiler outputs errors
    }
})
