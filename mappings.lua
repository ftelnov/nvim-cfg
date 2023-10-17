---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>fm"] = "",
    ["<leader>fa"] = "",
    ["<leader>td"] = "",
  },
}

M.general = {
  n = {
    -- remaps
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "Format with conform",
    },
    ["<leader>sd"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Show Git deleted lines",
    },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- LiveGrep with args is more powerful, as supports ripgrep filters.
    ["<leader>fa"] = { ":Telescope live_grep_args live_grep_args<CR>", "Telescope LiveGrep With Args" },
    -- close quickfix ASAP.
    ["cq"] = { ":cclose<CR>" },

    -- Troubles checks.
    ["<leader>tt"] = {
      function()
        require("trouble").toggle()
      end,
      "Trouble Toggle",
    },
    ["<leader>tl"] = {
      function()
        require("trouble").toggle "loclist"
      end,
      "Trouble Toggle Loclist",
    },
    ["<leader>tw"] = {
      function()
        require("trouble").toggle "workspace_diagnostics"
      end,
      "Trouble Toggle Workspace Diagnostics",
    },
    ["<leader>td"] = {
      function()
        require("trouble").toggle "document_diagnostics"
      end,
      "Trouble Toggle Document Diagnostics",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
