return {
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = lint.linters_by_ft or {}

      -- Biome set
      -- lint.linters_by_ft['javascript'] = { 'biomejs' }
      -- lint.linters_by_ft['typescript'] = { 'biomejs' }
      -- lint.linters_by_ft['javascriptreact'] = { 'biomejs' }
      -- lint.linters_by_ft['typescriptreact'] = { 'biomejs' }
      -- lint.linters_by_ft['json'] = { 'biomejs' }

      -- ESlint set
      lint.linters_by_ft['javascript'] = { 'eslint_d' }
      lint.linters_by_ft['typescript'] = { 'eslint_d' }
      lint.linters_by_ft['javascriptreact'] = { 'eslint_d' }
      lint.linters_by_ft['typescriptreact'] = { 'eslint_d' }
      lint.linters_by_ft['json'] = { 'eslint_d' }

      -- Others
      -- Kind of annoying as it also spits out shit in Hover Definition
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      lint.linters_by_ft['glsl'] = { 'glslc' }
      lint.linters_by_ft['html'] = { 'htmlhint' }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
