local lspsaga = require 'lspsaga'
lspsaga.setup { -- defaults ...
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic sign
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  diagnostic_header_icon = "   ",
  -- code action title icon
  code_action_icon = " ",
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  max_preview_lines = 10,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",
  },
  definition_preview_icon = "  ",
  border_style = "single",
  rename_prompt_prefix = "➤",
  server_filetype_map = {},
  diagnostic_prefix_format = "%d. ",
}


--local saga = require 'lspsaga'

---- add your config value here
---- default value
---- use_saga_diagnostic_sign = true
---- error_sign = '',
---- warn_sign = '',
---- hint_sign = '',
---- infor_sign = '',
---- dianostic_header_icon = '   ',
---- code_action_icon = ' ',
---- code_action_prompt = {
----   enable = true,
----   sign = true,
----   sign_priority = 20,
----   virtual_text = true,
---- },
---- finder_definition_icon = '  ',
---- finder_reference_icon = '  ',
---- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
---- finder_action_keys = {
----   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
---- },
---- code_action_keys = {
----   quit = 'q',exec = '<CR>'
---- },
---- rename_action_keys = {
----   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
---- },
---- definition_preview_icon = '  '
---- "single" "double" "round" "plus"
---- border_style = "single"
---- rename_prompt_prefix = '➤',
---- if you don't use nvim-lspconfig you must pass your server name and
---- the related filetypes into this table
---- like server_filetype_map = {metals = {'sbt', 'scala'}}
---- server_filetype_map = {}

----saga.init_lsp_saga {
  ----your custom option here
----}

----or --use default config
--saga.init_lsp_saga()

----local saga = require 'lspsaga'

------ add your config value here
------ default value
------ use_saga_diagnostic_sign = true
------ error_sign = '',
------ warn_sign = '',
------ hint_sign = '',
------ infor_sign = '',
------ dianostic_header_icon = '   ',
------ code_action_icon = ' ',
------ code_action_prompt = {
------   enable = true,
------   sign = true,
------   sign_priority = 20,
------   virtual_text = true,
------ },
------ finder_definition_icon = '  ',
------ finder_reference_icon = '  ',
------ max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
------ finder_action_keys = {
------   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
------ },
------ code_action_keys = {
------   quit = 'q',exec = '<CR>'
------ },
------ rename_action_keys = {
------   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
------ },
------ definition_preview_icon = '  '
------ "single" "double" "round" "plus"
------ border_style = "single"
------ rename_prompt_prefix = '➤',
------ if you don't use nvim-lspconfig you must pass your server name and
------ the related filetypes into this table
------ like server_filetype_map = {metals = {'sbt', 'scala'}}
------ server_filetype_map = {}

------saga.init_lsp_saga {
  ------your custom option here
------}

------or --use default config
----saga.init_lsp_saga()
