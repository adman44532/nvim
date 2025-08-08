local utils = require 'utils'

-- Base blink.cmp config
local blink_cmp_config = {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      opts = {},
    },
    'folke/lazydev.nvim',
  },
  opts = {
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
    },
    sources = {
      default = { 'lsp', 'path', 'lazydev', 'snippets' }, -- Avante will be conditionally inserted
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        lsp = { score_offset = 50 },
        snippets = { score_offset = -100 },
      },
    },
    snippets = { preset = 'default' },
    fuzzy = { implementation = 'prefer_rust' },
    signature = { enabled = true },
  },
}

-- Dynamically inject Avante config if available
if utils.has_make() and utils.has_npm() then
  -- Add avante plugin dependency
  table.insert(blink_cmp_config.dependencies, 'Kaiser-Yang/blink-cmp-avante')

  -- Add avante as a source and provider
  table.insert(blink_cmp_config.opts.sources.default, 1, 'avante')
  blink_cmp_config.opts.sources.providers.avante = {
    module = 'blink-cmp-avante',
    name = 'Avante',
    opts = {
      -- your custom avante options here if needed
    },
  }
end

return blink_cmp_config
