local lint = require "lint"
local eslint = "eslint_d"

lint.linters_by_ft = {
  html = { "tidy" },
  css = { "stylelint" },
  markdown = { "markdownlint" },
  sh = { "shellcheck" },
  zsh = { "shellcheck" },
  javascript = { eslint },
  typescript = { eslint },
  typescriptreact = { eslint },
}
