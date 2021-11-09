let g:cmake_vimspector_support=1

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
