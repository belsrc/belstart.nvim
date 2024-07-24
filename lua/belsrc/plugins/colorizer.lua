return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {
      css = {
        css = true,
      },
      javascript = {
        names = false,
      },
      html = {
        names = false,
      },
      md = {
        names = false,
      },
      lua = {
        names = false,
      },
    }
  end,
}
