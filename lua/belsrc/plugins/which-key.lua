return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 0,
  },
  config = function()
    require('which-key').setup()

    require('which-key').add {
      { '<leader>b', group = ' [b]uffer' },
      { '<leader>c', group = ' [c]ode' },
      { '<leader>d', group = ' [d]ocument' },
      { '<leader>e', group = ' [e]rror' },
      { '<leader>f', group = ' [f]olding' },
      { '<leader>g', group = ' [g]it' },
      { '<leader>m', group = ' [m]arkdown' },
      { '<leader>p', group = '󰙅 [p]roject' },
      { '<leader>r', group = ' [r]estart' },
      { '<leader>s', group = ' [s]earch' },
      { '<leader>S', group = ' [S]ession' },
      { '<leader>t', group = ' [t]oggle' },
      { '<leader>w', group = ' [w]rap' },
    }
  end,
}
