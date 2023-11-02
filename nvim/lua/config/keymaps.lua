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

vim.keymap.set("n", "<leader>1", ":BufferLineCyclePrev<cr>", { silent = true })
vim.keymap.set("n", "<leader>2", ":BufferLineCycleNext<cr>", { silent = true })
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


vim.keymap.set('n', "<F5>", function()
	require('dap').continue()
end
)
-- vim.keymap.set('n', "<F4>", ":call vimspector#Restart()<cr>")
vim.keymap.set('n', "<F6>", require('dap').pause)
vim.keymap.set('n', "<F9>", require('dap').toggle_breakpoint)
vim.keymap.set('n', "<S-F9>", function()
	-- doesn't seem to be called at all in ubunut terminal, because shift f9 does not get passed to vim
	assert(false)
	require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
vim.keymap.set('n', "<F10>", require('dap').step_over)
vim.keymap.set('n', "<S-F11>", require('dap').step_out)
vim.keymap.set('n', "<F11>", require('dap').step_into)

vim.keymap.set('n', "gh", "<cmd>ClangdSwitchSourceHeader<cr>")

vim.keymap.set('n', '<leader>e', "<cmd>NeoTreeFocusToggle<cr>")
vim.keymap.set('n', '<leader>o', "<cmd>NeoTreeFocus<cr>")
-- paste in visual mode without overwriting paste register
vim.keymap.set('v', 'p', '"_dP', { silent = true, noremap = true })

vim.keymap.set('n', '<esc><esc>', '<cmd>nohlsearch<cr>')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)


vim.keymap.set('n', '<c-q>', require('misc.toggle_qf').toggle_qf)




-- vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
-- local cmp_ok, cmp = pcall(require, "cmp")
-- if not cmp_ok or cmp == nil then
--   cmp = {
--     mapping = function(...) end,
--     setup = { filetype = function(...) end, cmdline = function(...) end },
--     config = { sources = function(...) end },
--   }
-- end
-- local function t(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
--
-- cmp.mapping["<c-h>"] = cmp.mapping(function()
--   vim.api.nvim_feedkeys(vim.fn["copilot#Accept"](t "<Tab>"), "n", true)
-- end)
-- lvim.keys.insert_mode["<M-]>"] = { "<Plug>(copilot-next)", { silent = true } }
-- lvim.keys.insert_mode["<M-[>"] = { "<Plug>(copilot-previous)", { silent = true } }
-- lvim.keys.insert_mode["<M-\\>"] = { "<Cmd>vertical Copilot panel<CR>", { silent = true } }

vim.keymap.set('n', '<leader>m', ':MaximizerToggle!<CR>', { noremap = true, silent = true })

local wk = require('which-key')

---jump to the window of specified dapui element
---@param element string filetype of the element
local function jump_to_element(element)
	local visible_wins = vim.api.nvim_tabpage_list_wins(0)

	for _, win in ipairs(visible_wins) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == element then
			vim.api.nvim_set_current_win(win)
			return
		end
	end

	vim.notify(("element '%s' not found"):format(element), vim.log.levels.WARN)
end

wk.register({
	d = {
		name = "+Debug",
		d = { ":call vimspector#Launch()<cr>", "Launch debugging" },
		c = {
			":call GotoWindowNoMax(g:vimspector_session_windows.code)<cr>",
			"Focus code",
		},
		t = {
			function() jump_to_element("dapui_console") end,
			"Focus console",
		},
		r = {
			function() jump_to_element("dap-repl") end,
			"Focus REPL",
		},
		v = {
			function() jump_to_element("dapui_scopes") end,
			"Focus variables",
		},
		w = {
			function() jump_to_element("dapui_watches") end,
			"Focus watches",
		},
		s = {
			function() jump_to_element("dapui_stacks") end,
			"Fockus stack trace",
		},
		i = {
			function()
				require("dapui").eval()
				jump_to_element("dapui_hover")
			end,
			"Evaluate Expression",
			silent = true,
		},
		e = { require('dap').disconnect, "Stop debugging" },
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

-- wk.register({
-- 	m = {
-- 		name = "+Markdown",
-- 		p = { ":MarkdownPreview<cr>", "Preview markdown" },
-- 	}
-- }, { prefix = "<leader>", buffer = 0 })

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
