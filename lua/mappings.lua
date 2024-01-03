vim.keymap.set("n", "<esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })

-- switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })

vim.keymap.set("n", "<tab>", ":bnext<CR>", { desc = "Goto next buffer" })
vim.keymap.set("n", "<S-tab>", ":bprev<CR>", { desc = "Goto prev buffer" })
vim.keymap.set("n", "<leader>x", ":bd<CR>", { desc = "Close current buffer" })

vim.keymap.set("n", "<leader><tab>", ":wincmd w<CR>", { desc = "Focus on the floating window." })
vim.keymap.set("n", "<leader>tf", function()
	local new_value = not vim.api.nvim_get_option_value("foldenable", {})
	local ufo = require("ufo")
	vim.api.nvim_set_option_value("foldenable", new_value, {})
	if new_value then
		ufo.openAllFolds()
	else
		ufo.closeAllFolds()
	end
end, { desc = "Toggle fold column on the side." })

vim.keymap.set("n", "gt", function()
	vim.lsp.buf.type_definition()
end, { desc = "LSP: go to current symbol's type definition." })

vim.keymap.set("n", "<C-s>", "<cmd>wa <CR>", { desc = "Save all files." })
vim.keymap.set("n", "<leader>sd", function()
	require("gitsigns").toggle_deleted()
end, { desc = "Show Git deleted lines." })
vim.keymap.set("n", "<leader>gh", function()
	require("gitsigns").preview_hunk()
end, { desc = "Toggle Git preview for the current hunk." })
vim.keymap.set("n", "<C-s>", "<cmd>wa <CR>", { desc = "Save all files." })

vim.keymap.set("n", "cq", "<cmd>cclose<CR>", { desc = "Close quickfix asap." })
vim.keymap.set("v", ">", ">gv", { desc = "Indent in the visual mode" })

return M
