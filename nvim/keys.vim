" Map [ and ] to ü and +  (where they are on the QWERTY layout)
"nnoremap ü [
"nnoremap + ]
"nnoremap ´ +
"imap ü [
"imap Ü {
"imap + ]
"imap * [

"" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" NerdTree
nmap <F2> :NERDTreeToggle<CR>

" Tabs
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
" nmap <C-w> :bd<CR>


" vimspector
" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindowNoMax(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindowNoMax(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindowNoMax(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindowNoMax(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindowNoMax(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindowNoMax(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

" F5 is be usable also in insert mode
map <F5> :wa  <CR> <Plug>VimspectorContinue
nmap <leader><F5> <Plug>VimspectorPause

nmap <F7> <Plug>VimspectorStepInto
nmap <leader><F7> <Plug>VimspectorStepOut
nmap <F8> <Plug>VimspectorStepOver
nmap <leader><F8> <Plug>VimspectorRunToCursorRunToCursor
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <leader><F9> <Plug>VimspectorToggleConditionalBreakpoint


"nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

"nmap <leader>dl <Plug>VimspectorStepInto
"nmap <leader>dj <Plug>VimspectorStepOver
"nmap <leader>dk <Plug>VimspectorStepOut
"nmap <leader>d_ <Plug>VimspectorRestart
"nnoremap <leader>d<space> :call vimspector#Continue()<CR>

"nmap <leader>drc <Plug>VimspectorRunToCursor
"nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
"nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <C-f> <cmd>lua vim.lsp.buf.formatting()<CR>

""" Save/leave edit mode stuff"""
" Press ww to do a w!
inoremap ww <ESC>:w!<CR>
" nnoremap ww <ESC>:w!<CR>
vnoremap ww <ESC>:w!<CR>
" Press nww to do a save on normal mode
nnoremap nww <ESC>:w!<CR>
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

"inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <TAB>     compe#confirm('<CR>') 
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Stuff for quick fix lists
" Taken from
" https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen/plugin/navigation.vim
"
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz
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

