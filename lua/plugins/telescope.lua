---@type LazyPluginSpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-smart-history.nvim",
      "kkharji/sqlite.lua",
    },
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local config_path = vim.fn.stdpath "config"
    telescope.setup {
      defaults = {
        history = {
          path = config_path .. "/telescope_history.sqlite3",
          limit = 100,
        },
        mappings = {
          i = {
            ["<C-Down>"] = actions.cycle_history_next,
            ["<C-Up>"] = actions.cycle_history_prev,
          },
        },
      },
    }
    telescope.load_extension "live_grep_args"
    telescope.load_extension "smart_history"
  end,
  keys = {
    { "<leader>fa", ":Telescope live_grep_args live_grep_args<CR>", desc = "Telescope LiveGrep With Args" }
  }
}
