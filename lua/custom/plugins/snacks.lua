return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    -- dashboard = { enabled = true },
    -- explorer = { enabled = true },
    image = {
      enabled = true,
      doc = {
        inline = true, -- Enable inline images in markdown, html, etc.
        float = true, -- Allow images in floating windows
      },
      max_width = 120, -- Maximum image width in columns
      max_height = 40, -- Maximum image height in rows
      math = {
        enabled = true, -- Enable LaTeX math rendering
      },
    },
    gh = { enabled = true },
    -- indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        gh_issue = {},
        gh_pr = {},
      },
    },
    -- notifier = { enabled = true },
    quickfile = { enabled = true },
    -- scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      '<leader>gi',
      function()
        Snacks.picker.gh_issue()
      end,
      desc = '[G]itHub [I]ssues (open)',
    },
    {
      '<leader>gp',
      function()
        Snacks.picker.gh_pr()
      end,
      desc = '[G]itHub [P]ull Requests (open)',
    },
    {
      '<leader>gI',
      function()
        Snacks.picker.gh_issue { state = 'all' }
      end,
      desc = '[G]itHub [I]ssues (all)',
    },
    {
      '<leader>gP',
      function()
        Snacks.picker.gh_pr { state = 'all' }
      end,
      desc = '[G]itHub [P]ull Requests (all)',
    },
  },
}
