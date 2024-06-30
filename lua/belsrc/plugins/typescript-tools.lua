return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    expose_as_code_action = 'all',
    complete_function_calls = true,
    include_completions_with_insert_text = true,
  },
}
