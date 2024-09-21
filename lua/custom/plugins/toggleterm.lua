return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      -- other options can be added here
      float_opts = {
        border = 'curved', -- customize the border style
      },
      -- Set defaults for vertical terminals
      size = 80, -- Adjust this value to set the width of the vertical terminal
      direction = 'vertical',
    }

    -- Set the key mapping for toggling terminal in float mode
    vim.keymap.set('n', '<leader>st', '<cmd>ToggleTerm direction=float<CR>', { noremap = true, silent = true, desc = 'Toggle [S]t Terminal (Float)' })

    -- Set the key mapping for toggling terminal in vertical mode
    vim.keymap.set('n', '<leader>sv', '<cmd>ToggleTerm direction=vertical<CR>', { noremap = true, silent = true, desc = 'Toggle [S]v Terminal (Vertical)' })

    vim.keymap.set('t', '<Esc><Esc>', [[<C-\><C-n><C-w>p]], { noremap = true, silent = true, desc = 'Exit terminal mode and move to previous window' })
  end,
}
