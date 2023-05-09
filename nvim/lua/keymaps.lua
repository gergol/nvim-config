vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-z>", "<nop>") -- disable tty ctrl-z suspend to prevent accidentaly closing vim)
vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("i", "jk", "<esc>:w!<cr>")
-- disabe arrow keys
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Right>", "<nop>")

vim.keymap.set("v", "<Up>", "<nop>")
vim.keymap.set("v", "<Down>", "<nop>")
vim.keymap.set("v", "<Left>", "<nop>")
vim.keymap.set("v", "<Right>", "<nop>")

vim.keymap.set("i", "<Up>", "<nop>")
vim.keymap.set("i", "<Down>", "<nop>")
vim.keymap.set("i", "<Left>", "<nop>")
vim.keymap.set("i", "<Right>", "<nop>")


