---@type MappingsTable
local M = {}

M.disabled = {
  n = {
      ["<leader>fa"] = "",
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- LiveGrep with args is more powerful, as supports ripgrep filters.
    ["<leader>fa"] = {":Telescope live_grep_args live_grep_args<CR>", "Telescope LiveGrep With Args"},
    -- close quickfix ASAP.
    ["cq"] = {":cclose<CR>"}
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

return M
