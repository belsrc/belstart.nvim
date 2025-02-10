return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true,
    colors = {
      error = { '#FE4040' },
      warning = { '#F8991D' },
      info = { '#1FCDFF' },
      hint = { '#50E3C2' },
      success = { '#61D800' },
      performance = { '#E040FB' },
    },
    keywords = {
      TODO = { color = 'warning', icon = ' ' },
      HACK = { color = 'error', icon = ' ' },
      DEBUG = { color = 'info', icon = ' ', alt = { 'FIX', 'FIXME' } },
      REVIEW = { color = 'info', icon = ' ' },
      NOTE = { color = 'hint', icon = ' ', alt = { 'INFO' } },
      REMARK = { color = 'success', icon = ' ' },
      PERF = { color = 'performance', icon = '󰓅' },
    },
  },
}
