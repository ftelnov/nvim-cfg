-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
require("lazy_cfg")
require("mappings")
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = { "rust" },
	callback = function(ev)
		local utils = require("core.utils")
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
vim.o.foldenable = false

autocmd("TermOpen", {
	callback = function()
		vim.opt_local.spell = false
	end,
})

vim.opt.exrc = true

-- prevent vim from ending trailing line in files.
vim.opt.fixeol = false

-- needed for notify and other plugins.
-- https://github.com/neovim/neovim/issues/2528#issuecomment-236373505
vim.opt.termguicolors = true
vim.opt.showcmd = false

vim.api.nvim_set_hl(0, "Comment", { italic = true })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "green", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "blue", bold = true })

_G.cfg = require("configs")
require("env")
