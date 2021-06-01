require'lspconfig'.clangd.setup{}

-- clangd relies on a JSON compilation database specified as compile_commands.json or, for simpler projects, a compile_flags.txt. For details on how to automatically generate one using CMake look here.
-- https://cmake.org/cmake/help/latest/variable/CMAKE_EXPORT_COMPILE_COMMANDS.html
-- TLDR: Need to add ??? somethoingwith CMAKE_EXPORT_COMPILE_COMMANDS to the projects cmake file....
