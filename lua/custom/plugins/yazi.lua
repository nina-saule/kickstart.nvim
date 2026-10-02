return {
  'mikavilpas/yazi.nvim',
  -- Disabled: plugin not updating / not working properly
  enabled = false,
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
  },
  keys = {
    {
      '<leader>zz',
      '<cmd>Yazi<cr>',
      desc = 'Open Yazi at the current file',
    },
    {
      -- Open in the current working directory
      '<leader>zd',
      '<cmd>Yazi cwd<cr>',
      desc = 'Yazi in cwd',
    },
    {
      '<leader>zr',
      '<cmd>Yazi toggle<cr>',
      desc = 'Yazi resume (toggle)',
    },
  },
  opts = {
    open_for_directories = true,
    keymaps = {
      show_help = '<f1>',
    },
  },
  init = function()
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrw = 1
    -- vim.g.loaded_netrwPlugin = 1
  end,
}
