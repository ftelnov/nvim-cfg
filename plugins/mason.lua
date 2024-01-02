---@type LazyPluginSpec
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- primary
      "python-lsp-server",
      "clangd",
      "clang-format",
      "fortls",
      "rust-analyzer",
      "asm-lsp",

      -- shell
      "bash-language-server",
      "shellcheck",
      "shfmt",

      "lua-language-server",
      "luacheck",
      "gopls",

      -- web stuff
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "phpactor",
      "phpcs",
      "phpcbf",
      "prettier",
      "eslint_d",

      -- formats
      "json-lsp",
      "yamlfmt",
      "yaml-language-server",
      "marksman",
      "black",
    },
  },
}
