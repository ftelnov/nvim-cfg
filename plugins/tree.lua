---@type LazyPluginSpec
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
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
  },
}
