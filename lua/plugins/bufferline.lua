---@type NvPluginSpec
return {
  "akinsho/bufferline.nvim",
  lazy = false,
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  init = function()
    vim.opt.termguicolors = true
    require("bufferline").setup {}
  end,
}
