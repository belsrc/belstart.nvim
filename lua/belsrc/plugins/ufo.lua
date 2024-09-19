return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
  },
  event = 'BufRead',
  keys = {
    {
      'zR',
      function()
        require('ufo').openAllFolds()
      end,
      desc = 'Fold: Open all folds',
    },
    {
      'zM',
      function()
        require('ufo').closeAllFolds()
      end,
      desc = 'Fold: Close all folds',
    },
    {
      'zZ',
      function()
        require('ufo').peekFoldedLinesUnderCursor()
      end,
      desc = 'Fold: Peek folded lines under cursor',
    },
  },
  opts = {
    open_fold_hl_timeout = 0,
    preview = {
      win_config = {
        winblend = 0,
        winhighlight = 'Normal:LazyNormal',
      },
    },
  },
}
