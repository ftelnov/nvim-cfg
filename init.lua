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

autocmd("BufWritePost", {
  callback = function()
    require("lint").try_lint()
  end,
})

-- autocmd("BufWritePost", {
--   callback = function(ev)
--     local state = require "hbac.state"
--     local actions = require "hbac.command.actions"
--     if state.is_pinned(ev.buf) then
--       actions.toggle_pin(ev.buf)
--     end
--   end,
-- })
--
-- spellchecking

vim.opt.spell = true
vim.opt.spelloptions = "camel"
vim.opt.spelllang = "en_us,ru_ru"

autocmd("TermOpen", {
  callback = function()
    vim.opt_local.spell = false
  end,
})

vim.opt.exrc = true

-- prevent vim from ending trailing line in files.
vim.opt.fixeol = false

_G.cfg = require "custom.configs"
