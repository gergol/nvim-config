nmap <space> <leader>

imap <silent> jk <esc>
vnoremap <silent> ii <esc> i
vnoremap <silent> aa <esc> a
vnoremap <silent> ss <esc> s
vnoremap <silent> cc <esc> c
" Map [ and ] to ü and +  (where they are on the QWERTY layout)
"nnoremap ü [
"nnoremap + ]
"nnoremap ´ +
"imap ü [
"imap Ü {
"imap + ]
"imap * [

" Keep visual selection after indenting
:vnoremap < <gv
:vnoremap > >gv



"" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" NerdTree
map <F2> :NERDTreeToggle<CR>

" Tabs
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
" nmap <C-w> :bd<CR>
"" Close current buffer without closing split window 
nmap ,d :b#<bar>bd#<CR>
nmap ,d! :b#<bar>bd#!<CR>


"" NVIM Bufferline
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
"nnoremap <silent><leader>1 :BufferLineMovePrev<CR>
"nnoremap <silent><leader>2 :BufferLineMoveNext<CR>
nnoremap <silent><leader>1 :BufferLineCyclePrev<CR>
nnoremap <silent><leader>2 :BufferLineCycleNext<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
"nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>

" yank/paste from system clipboard more conveniently
" These previous remaps below are no longer needed as we set set clipboard=unnamedplus
" which makes the system clipblard the default one. Use ctrl-shift-v to paste
" in a terminal.

" paste in visual mode without overwriting paste register
vnoremap p "_dP

" ===== FOLDING ======
" Fold an indent
nmap zb zfai
" go down 2 lines and fold indent. Useful for cpp functions.
nmap zbb 2jzfai

"======= SEARCH REPLACE ===========
" Search and replace word under cursor in all files in arglist
nnoremap <leader>rr yiw:silent! argdo %s/\<<C-r>"\>//g<left><left>

" vimspector
" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindowNoMax(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindowNoMax(g:vimspector_session_windows.terminal)<CR>
nnoremap <leader>dv :call GotoWindowNoMax(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindowNoMax(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindowNoMax(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindowNoMax(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

"" Trouble 
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
"function! BuildAndDebug()
    "%update
    "CMakeBuild
    "call Vimspector#Launch()
"endfunction

"command! BuildAndDebug :%update | :CMakeBuild | :call vimspector#Launch()
autocmd FileType cpp  nnoremap <buffer><silent><leader>bb :wa<cr> <bar> :%update <bar> :CMakeBuild all<CR>
autocmd FileType cpp  nnoremap <buffer><silent><leader>dx :Dox<CR>
" jump to test for the current source file. This assumes that the tests are named test_<NAME OF CURRENT CPP/HPP FILE>.cpp
autocmd FileType cpp  nnoremap <leader>gtt :execute ':find ' . 'test_' . expand('%:t:r') . '.cpp'<cr>
" F5 is be usable also in insert mode
map <silent> <F5> :wa <bar> call vimspector#Continue()<CR>
inoremap <silent> <F5> <esc>:wa<cr> <bar> call vimspector#Continue()<cr> 
"inoremap <silent> <F5> <esc>:wa<cr> <bar> call vimspector#Continue()<cr> 
"<esc>wa <bar> call vimspector#Continue()<CR>
"map <F5> :wa  <CR> <Plug>VimspectorContinue
nmap <leader><F5> <Plug>VimspectorPause

nmap <F7> <Plug>VimspectorStepInto
nmap <leader><F8> <Plug>VimspectorStepOut
nmap <F8> <Plug>VimspectorStepOver
nmap <leader><F8> <Plug>VimspectorRunToCursorRunToCursor
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <leader><F9> <Plug>VimspectorToggleConditionalBreakpoint

nnoremap   <silent>   <leader>tn    :FloatermNew<CR>
tnoremap   <silent>   <leader>tn    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <leader>tk   :FloatermPrev<CR>
tnoremap   <silent>   <leader>tk    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <leader>tj    :FloatermNext<CR>
tnoremap   <silent>   <leader>tj    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <leader>tt   :FloatermToggle<CR>
" i had to unmapt leader in terminal mode because typeing <space> would result
" in a horrible lag in Floaterm.
"tnoremap   <silent>   <leader>tt   <C-\><C-n>:FloatermToggle<CR>
nnoremap   <silent>   <C-t>   :FloatermToggle<CR>
tnoremap   <silent>   <C-t>   <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <Esc> <C-\><C-n>
" in terminal mode hit ctrl+b to go back to the previously opened buffer.
tnoremap <silent> <C-b> <C-\><C-n>:b#<CR>


"nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

"nmap <leader>dl <Plug>VimspectorStepInto
"nmap <leader>dj <Plug>VimspectorStepOver
"nmap <leader>dk <Plug>VimspectorStepOut
"nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

"nmap <leader>drc <Plug>VimspectorRunToCursor
"nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
"nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" telescope
nnoremap <leader>fs <cmd> :Telescope aerial<cr>
"nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols ()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<cr>
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fd <cmd>Telescope harpoon marks<cr>


" harppon
nnoremap <silent><leader>a <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><leader>hh <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc <cmd>lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><leader>j :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>k :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>l :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>; :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <silent><leader>' :lua require("harpoon.ui").nav_file(5)<CR>

nnoremap <C-1> :lua require("harpoon").nav_prev()
nnoremap <C-2> :lua require("harpoon").nav_next()

nnoremap <silent><leader>tj :lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <silent><leader>tk :lua require("harpoon.term").gotoTerminal(2)<CR>
nnoremap <silent><leader>cj :lua require("harpoon.term").sendCommand(1, 1)<CR>
nnoremap <silent><leader>ck :lua require("harpoon.term").sendCommand(1, 2)<CR>

" LSP config (the mappings used in the default file don't quite work right)
"nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
"nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
"nnoremap <silent> <C-f> <cmd>lua vim.lsp.buf.formatting()<CR>

""" Save/leave edit mode stuff"""
" Press ww to do a w!
inoremap ww <ESC>:w!<CR>
" nnoremap ww <ESC>:w!<CR>
vnoremap ww <ESC>:w!<CR>
" Press <leader>ww to do a save on normal mode
nnoremap <leader>ww <ESC>:w!<CR>
" Press Ctrl-S to save
noremap <C-s> <ESC>:w!<CR>

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Git stuff
" in diff get the LHS (f is on the lhs)
nmap <leader>gf :diffget //2<CR>
" in diff get the RHS (j is on the rhs)
nmap <leader>gj :diffget //3<CR>
nmap <leader>gs :G<CR>

" Autocomplete keys
"
"Github copilot accept suggestion
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
"inoremap <silent><expr> <C-Space> compe#complete()
"inoremap <silent><expr> <tab>     pumvisible() ? compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()")) : "\<tab>"
"inoremap <silent><expr> <C-e>     compe#close('<C-e>')
""inoremap <silent><expr> <CR>      pumvisible() ? compe#close('<CR>') : "\<CR>"
"inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
"inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Stuff for quick fix lists
" Taken from
" https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen/plugin/navigation.vim
"
nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz
nnoremap <leader>i :lnext<CR>zz
nnoremap <leader>o :lprev<CR>zz
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <leader>q :call ToggleQFList(0)<CR>

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun

" lspsaga:
nnoremap <silent><leader><CR> :Lspsaga code_action<CR>
vnoremap <silent><leader><CR> :<C-U>Lspsaga range_code_action<CR>

