local lspconfig = require("lspconfig")
local nv_lsp = require("plugins.configs.lspconfig")
local default_on_attach = nv_lsp.on_attach
local capabilities = nv_lsp.capabilities

local function on_attach(client, buf_nr) default_on_attach(client, buf_nr) end

-- if you just want default config for the servers then put them in a table
-- Rust is not placed here, as it is managed by the rust-tools.
local servers = {
    "html",
    "cssls",
    "tsserver",
    "clangd",
    "pylsp",
    "yamlls",
    "jsonls",
    "gopls",
    "marksman",
    "fortls",
    "phpactor",
    "asm_lsp",
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "sh", "zsh" },
})

return {
    on_attach = on_attach,
    capabilities = capabilities,
}
