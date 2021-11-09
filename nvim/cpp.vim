" Stuff to configure vim for cpp
" Following this guider here: https://idie.ru/posts/vim-modern-cpp
"

"
" Accessing Standard Library documentation using cppman
"
" The following needs to be installed first:
" $ sudo apt-get install cppman
"
" Vim ships with a man page viewer that works out of the box on any modern *nix via :Man command. But the system man pages do not contain the definitions for C++. Let’s fix it by installing Cppman.
"
" Cppman is a set of C++ 98/11/14/17/20 manual pages for Linux, with source from cplusplus.com and cppreference.com. You can easily install using pip or the package manager for your distribution according to their Installation guide. Next, let’s configure vim.
"
" By default, when you press K, vim grabs the keyword under the cursor, separated by iskeyword symbols. There is one problem. The : symbol often found in C++ definitions is not included in the iskeyword array. So, for example, when you press K under the keyword std::string, vim will try to find the man page for std, instead of the full identifier. Let’s fix it with this small function:

function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()

au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>
au FileType hpp nnoremap <buffer>K :JbzCppMan<CR>
