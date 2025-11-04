return {
  'atiladefreitas/dooing',
  config = function()
    require('dooing').setup {
      window = {
        width = 70,         -- Width of the floating window
        height = 25,        -- Height of the floating window
      },
      keymaps = {
        toggle_window = "<leader>to",      -- [T]oggle t[o]do
        open_project_todo = "<leader>tp",  -- [T]oggle [p]roject todo
      },
    }
  end,
}
