---@type LazyPluginSpec
return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>dl",
			function()
				require("trouble").toggle("loclist")
			end,
			desc = "Trouble Toggle local list",
		},
		{
			"<leader>dw",
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			desc = "Trouble Toggle local list",
		},
		{
			"<leader>dd",
			function()
				require("trouble").toggle("document_diagnostics")
			end,
			desc = "Trouble Toggle Document Diagnostics",
		},
	},
}
