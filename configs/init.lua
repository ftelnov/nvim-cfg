local rust_tools = {
  server = {
    on_attach = function(client)
      client.server_capabilities.semanticTokensProvider = nil
    end,
    settings = {
      ["rust-analyzer"] = {
        check = {
          command = "clippy",
        },
        inlayHints = {
          parameterHints = true,
        },
        cmd_env = {
          RUSTUP_TOOLCHAIN = "stable",
        },
      },
    },
  },
}

return {
  rust_tools = rust_tools,
  format = require("custom.configs.format").cfg,
}
