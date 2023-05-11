vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-z>", "<nop>") -- disable tty ctrl-z suspend to prevent accidentaly closing vim)
vim.keymap.set("n", "<C-s>", ":w<cr>")
vim.keymap.set("n", "<leader>ww", ":w<cr>")
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

vim.keymap.set("n", "<leader>1", ":BufferLineCyclePrev<cr>", { silent = true})
vim.keymap.set("n", "<leader>2", ":BufferLineCycleNext<cr>", { silent = true})
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set('n', "<C-k>", ":cprev<cr>")
vim.keymap.set('n', "<C-j>", ":cnext<cr>")

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>D', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })


vim.keymap.set('n', "<F5>", ":call vimspector#Continue()<cr>")
vim.keymap.set('n', "<F4>", ":call vimspector#Restart()<cr>")
vim.keymap.set('n', "<F6>", ":call vimspector#Pause()<cr>")
vim.keymap.set('n', "<F9>", ":call vimspector#ToggleBreakpoint()<cr>")
vim.keymap.set('n', "<S-F9>", ":call vimspector#ToggleAdvancedBreakpoint()<cr>")
vim.keymap.set('n', "<F10>", ":call vimspector#StepOver()<cr>")
vim.keymap.set('n', "<S-F11>", ":call vimspector#StepOut()<cr>")
vim.keymap.set('n', "<F11>", ":call vimspector#StepInto()<cr>")

vim.keymap.set('n', "gh", "<cmd>ClangdSwitchSourceHeader<cr>")

vim.keymap.set('n', '<leader>e', "<cmd>NeoTreeFocusToggle<cr>")
vim.keymap.set('n', '<leader>o', "<cmd>NeoTreeFocus<cr>")
-- paste in visual mode without overwriting paste register
vim.keymap.set('v', 'p', '_dP')

vim.keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<cr>')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')



local wk = require('which-key')

wk.register({
	d = {
		name = "+Debug",
		d = { ":call vimspector#Launch()<cr>", "Launch debugging" },
		c = {
			":call GotoWindowNoMax(g:vimspector_session_windows.code)<cr>",
			"Focus code",
		},
		t = {
			":call GotoWindowNoMax(g:vimspector_session_windows.terminal)<cr>",
			"Focus terminal",
		},
		v = {
			":call GotoWindowNoMax(g:vimspector_session_windows.variables)<cr>",
			"Focus variables",
		},
		w = {
			":call GotoWindowNoMax(g:vimspector_session_windows.watches)<cr>",
			"Focus watches",
		},
		s = {
			":call GotoWindowNoMax(g:vimspector_session_windows.stack_trace)<cr>",
			"Fockus stack trace",
		},
		o = {
			":call GotoWindowNoMax(g:vimspector_session_windows.output)<cr>",
			"Focus output",
		},
		i = {
			"<Plug>VimspectorBalloonEval",
			"Evaluate popup",
			silent = true,
		},
		e = { ":call vimspector#Reset()<cr>", "Stop debugging" },
	},

}, { prefix = "<leader>" })

wk.register({
	b = {
		name = "+Cmake",
		B = { ":CMake<cr>", "Create CMake project" },
		b = { ":CMakeBuild<cr>", "Build CMake project" },
		t = { ":Telescope cmake4vim select_build_type<cr>", "Select CMake build type" },
		T = { ":Telescope cmake4vim select_target<cr>", "Select CMake target" },
		k = { ":Telescope cmake4vim select_kit<cr>", "Select CMake kit" },
		C = { ":CMakeClean<cr>", "Clean project" },
		s = { ":CMakeCompileSource<cr>", "Compile current buffer" },
		r = { ":CMakeResetAndReload<cr>", "Reset cmake cache" },
		R = { ":CMakeReset<cr>", "Reset build folder completely" },
		i = { ":CMakeInfo<cr>", "Info" }
	}
}, { prefix = "<leader>" })

wk.register({
	f = {
		name = "+Telescope",
		-- actual keys are configured in telescope.lua
	}
}, { prefix = "<leader>" })

wk.register({
	h = {
		name = "+Harpoon",
		-- actual keys are configured in harpoon.lua
	}
}, { prefix = "<leader>" })
