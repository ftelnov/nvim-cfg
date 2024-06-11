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
local formatting = require("custom.configs.format")

return {
    rust_analyzer = rust_analyzer,
    format = formatting.cfg,
    setup_fmt = formatting.setup,
}
