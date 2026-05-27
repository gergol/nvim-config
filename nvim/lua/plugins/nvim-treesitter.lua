return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup {}

      require('nvim-treesitter').install {
        'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript',
        'vimdoc', 'vim', 'html', 'json', 'markdown', 'markdown_inline',
      }

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf = args.buf
          local ft = vim.bo[buf].filetype
          if pcall(vim.treesitter.start, buf) and ft == 'markdown' then
            vim.bo[buf].syntax = 'on'
          end
          if ft ~= 'python' then
            pcall(function()
              vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end)
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          lookahead = true,
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = 'V',
          },
          include_surrounding_whitespace = false,
        },
        move = {
          set_jumps = true,
        },
      }

      local sel = function(query, group)
        return function()
          require('nvim-treesitter-textobjects.select').select_textobject(query, group or 'textobjects')
        end
      end
      vim.keymap.set({ 'x', 'o' }, 'af', sel '@function.outer')
      vim.keymap.set({ 'x', 'o' }, 'if', sel '@function.inner')
      vim.keymap.set({ 'x', 'o' }, 'ac', sel '@class.outer')
      vim.keymap.set({ 'x', 'o' }, 'ic', sel('@class.inner'), { desc = 'Select inner part of a class region' })
      vim.keymap.set({ 'x', 'o' }, 'ia', sel '@parameter.inner')
      vim.keymap.set({ 'x', 'o' }, 'aa', sel '@parameter.outer')
      vim.keymap.set({ 'x', 'o' }, 'as', sel('@local.scope', 'locals'), { desc = 'Select language scope' })

      local move = require 'nvim-treesitter-textobjects.move'
      local m = { 'n', 'x', 'o' }

      vim.keymap.set(m, ']m', function() move.goto_next_start('@function.outer', 'textobjects') end)
      vim.keymap.set(m, ']C', function() move.goto_next_start('@class.outer', 'textobjects') end, { desc = 'Next class start' })
      vim.keymap.set(m, ']o', function() move.goto_next_start({ '@loop.inner', '@loop.outer' }, 'textobjects') end)
      vim.keymap.set(m, ']s', function() move.goto_next_start('@local.scope', 'locals') end, { desc = 'Next scope' })
      vim.keymap.set(m, ']z', function() move.goto_next_start('@fold', 'folds') end, { desc = 'Next fold' })
      vim.keymap.set(m, ']a', function() move.goto_next_start('@parameter.inner', 'textobjects') end)
      vim.keymap.set(m, ']M', function() move.goto_next_end('@function.outer', 'textobjects') end)
      vim.keymap.set(m, '][', function() move.goto_next_end('@class.outer', 'textobjects') end)
      vim.keymap.set(m, ']A', function() move.goto_next_end('@parameter.outer', 'textobjects') end)

      vim.keymap.set(m, '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end)
      vim.keymap.set(m, '[c', function() move.goto_previous_start('@class.outer', 'textobjects') end)
      vim.keymap.set(m, '[o', function() move.goto_previous_start({ '@loop.inner', '@loop.outer' }, 'textobjects') end)
      vim.keymap.set(m, '[s', function() move.goto_previous_start('@local.scope', 'locals') end, { desc = 'Prev scope' })
      vim.keymap.set(m, '[z', function() move.goto_previous_start('@fold', 'folds') end, { desc = 'Prev fold' })
      vim.keymap.set(m, '[a', function() move.goto_previous_start('@parameter.inner', 'textobjects') end)
      vim.keymap.set(m, '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end)
      vim.keymap.set(m, '[]', function() move.goto_previous_end('@class.outer', 'textobjects') end)
      vim.keymap.set(m, '[A', function() move.goto_previous_end('@parameter.outer', 'textobjects') end)

      local swap = require 'nvim-treesitter-textobjects.swap'
      vim.keymap.set('n', '<leader>a', function() swap.swap_next '@parameter.inner' end)
      vim.keymap.set('n', '<leader>A', function() swap.swap_previous '@parameter.inner' end)
    end,
  },
}
