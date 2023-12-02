local rust_analyzer = {
  ["rust-analyzer"] = {
    check = {
      command = "clippy",
    },
    inlayHints = {
      parameterHints = { enable = true },
    },
    cmd_env = {
      RUSTUP_TOOLCHAIN = "stable",
    },
  },
}

return {
  rust_analyzer = rust_analyzer,
  format = require("custom.configs.format").cfg,
}
