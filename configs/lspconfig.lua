local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- Rust is not placed here, as it is managed by the rust-tools.
local servers =
  { "html", "cssls", "tsserver", "clangd", "pylsp", "yamlls", "jsonls", "gopls", "marksman", "fortls", "phpactor" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "sh", "zsh" },
}
