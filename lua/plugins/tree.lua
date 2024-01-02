---@type LazyPluginSpec
return {
	"nvim-tree/nvim-tree.lua",
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NeoTree" },
  },
	config = function()
		-- pass to setup along with your other options
		require("nvim-tree").setup({
			git = {
				enable = true,
				ignore = false,
			},

			filters = { dotfiles = false, custom = { "^.git$" } },
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
				},
			},
		})
	end,
}
