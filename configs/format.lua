local prettier = { "prettierd, prettier" }

require("conform").setup {
  -- Map of filetype to formatters
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "black", "isort" },
    -- Use a sub-list to run only the first available formatter
    javascript = { prettier },
    markdown = { "prettierd" },
    rust = { "rustfmt" },
    go = { "gofmt" },
    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ["_"] = { "trim_whitespace" },
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
