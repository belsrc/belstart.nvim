return {
  'mcauley-penney/visual-whitespace.nvim', -- Display whitespace chars on highlight
  opts = {
    highlight = { link = "Visual" },
    space_char = '·',
    tab_char = '→',
    nl_char = '↲',
    cr_char = '←',
    enabled = true,
    excluded = {
      filetypes = {},
      buftypes = {}
    }
  },
}
