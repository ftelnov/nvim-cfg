---@type LazyPluginSpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			"vim",
			"lua",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"c",
			"markdown",
			"markdown_inline",
			"json",
			"yaml",
			"fortran",
			"rust",
		},
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = {
			enable = true,
			-- disable = {
			--   "python"
			-- },
		},
	},
}
