return {
  'rachartier/tiny-inline-diagnostic.nvim',
  event = 'VeryLazy',
  config = function()
    require('tiny-inline-diagnostic').setup {
      signs = {
        left = '',
        right = '',
        diag = '',
        arrow = '    ',
        up_arrow = '    ',
        vertical = ' │',
        vertical_end = ' └',
      },
      virt_texts = {
        priority = 99,
      },
    }
  end,
}
