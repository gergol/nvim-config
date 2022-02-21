autocmd User Startified setlocal cursorline

let g:startify_session_autoload = 1
let g:startify_session_before_save = [ 'silent! tabdo NERDTreeClose' ]
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1

let g:startify_enable_special      = 0
let g:startify_relative_path       = 1
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1

let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ 'bundle/.*/doc',
        \ ]
