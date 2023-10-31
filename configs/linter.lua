local lint = require "lint"

lint.linters_by_ft = {
  html = { "tidy" },
  css = { "stylelint" },
  markdown = { "markdownlint" },
  sh = { "shellcheck" },
  zsh = { "shellcheck" },
}
