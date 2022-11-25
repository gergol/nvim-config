return {
    setup = function()
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
    end,
}
