---@type LazyPluginSpec
return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		vim.notify = require("notify")
		require("notify").setup({
			level = 2,
			minimum_width = 50,
			render = "default",
			stages = "slide",
			timeout = 3000,
			top_down = true,
		})
	end,
}
