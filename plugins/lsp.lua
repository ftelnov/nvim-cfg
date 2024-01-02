---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- linting
    {
      "mfussenegger/nvim-lint",
      build = { "npm install -g markdownlint-cli", "npm install -g stylelint" },
      config = function()
        require "custom.configs.linter"
      end,
    },
    {
      "folke/trouble.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
  },
  build = { "cargo install cargo-binstall && cargo binstall cargo-nextest -y --secure" },
  config = function()
    require "plugins.configs.lspconfig"
    require "custom.configs.lspconfig"
  end,
}
