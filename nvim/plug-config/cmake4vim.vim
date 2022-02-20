let g:cmake_build_dir="./build"
let g:cmake_build_type="Debug"
let g:cmake_ctest_args="-j8 --output-on-failure --verbose"
let g:cmake_vimspector_support=1
let g:cmake_compile_commands=1
let g:cmake_kits_global_path=expand("$HOME/.config/nvim/cmake/.cmake-kits.json")
let g:cmake_selected_kit="clang-ninja"

let g:cmake_vimspector_default_configuration = {
           \ 'adapter': 'vscode-cpptools',
           \ 'configuration': {
               \ 'type': '',
               \ 'request': 'launch',
               \ 'cwd': '${workspaceRoot}',
               \ 'Mimode': 'gdb',
               \ 'args': [],
               \ 'program': ''
               \ }
           \ }
