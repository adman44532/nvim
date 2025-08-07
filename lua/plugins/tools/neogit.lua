return {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',  -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim', -- optional
      -- 'ibhagwan/fzf-lua', -- optional
      -- 'echasnovski/mini.pick', -- optional
      -- 'folke/snacks.nvim', -- optional
    },
    config = function()
      local neogit = require 'neogit'
      vim.keymap.set('n', '<leader>gs', neogit.open, { silent = true, noremap = true, desc = '[g]it [s]creen Open' })

      vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { silent = true, noremap = true, desc = '[g]it [c]ommit' })

      vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { silent = true, noremap = true, desc = '[g]it [p]ull' })

      vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { silent = true, noremap = true, desc = '[g]it [P]ush' })

      vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>',
        { silent = true, noremap = true, desc = '[g]it [b]ranch' })

      vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { silent = true, noremap = true, desc = '[g]it [B]lame' })
    end,
  }
