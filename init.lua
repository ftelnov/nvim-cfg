-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
  pattern = { "rust" },
  callback = function(ev)
    local utils = require "core.utils"
    utils.load_mappings("lspconfig", { buffer = ev.buf })
  end,
})

