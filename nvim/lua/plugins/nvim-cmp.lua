return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'FelipeLema/cmp-async-path', "rafamadriz/friendly-snippets" },

  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    luasnip.config.setup {
      require("luasnip.loaders.from_vscode").lazy_load(),
      require("luasnip.loaders.from_vscode").lazy_load({paths = {"./snippets"}})
    }

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- elseif luasnip.expand_or_jumpable() then
            --   luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources({
          { name = 'nvim_lsp',  max_item_count = 16, keyword_length = 3 },
          { name = 'luasnip' },
          { name = 'async_path' },
        },
        {
          { name = 'buffer', max_item_count = 4, keyword_length = 3 },
        }),
    }
  end

}
