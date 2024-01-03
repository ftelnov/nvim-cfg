---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- linting
    {
      "mfussenegger/nvim-lint",
      build = { "npm install -g markdownlint-cli", "npm install -g stylelint" },
      config = function()
        require "configs.linter"
      end,
    }
  },
  build = { "cargo install cargo-binstall && cargo binstall cargo-nextest -y --secure" },
  config = function()
    require "configs.lspconfig"
  end,
}
