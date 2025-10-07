return {
  settings = {
    cmake = {
      formatting = {
        enable = false,
        tabSize = 4,
      },
    },
  },
  -- Optional: You can also define an on_attach function here
  -- if you have settings specific to the CMake LSP.
  -- on_attach = function(client, bufnr)
  --   -- Add a keymap specific to CMake, for example
  -- end,
}
