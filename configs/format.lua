local prettier = { "prettierd", "prettier" }

require("conform").setup {
  formatters = {
    rustfmt = {
      command = "cargo fmt",
    },
  },
  -- Map of filetype to formatters
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "black", "isort" },
    -- Use a sub-list to run only the first available formatter
    javascript = { prettier },
    html = { prettier },
    css = { prettier },
    markdown = { prettier },
    json = { prettier },
    rust = { "rustfmt" },
    go = { "gofmt" },
  },
  -- If this is set, Conform will run the formatter on save.
  -- It will pass the table to conform.format().
  -- This can also be a function that returns the table.
  format_on_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_fallback = true,
    timeout_ms = 500,
  },
}
