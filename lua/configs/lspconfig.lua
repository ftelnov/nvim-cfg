local lspconfig = require("lspconfig")
local capabilities = nil
local configs = require("configs")

local function on_attach(client, buf_nr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(buf_nr, true)
	end
end

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
	"rust_analyzer",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = configs.rust_analyzer,
})

lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "sh", "zsh" },
})
