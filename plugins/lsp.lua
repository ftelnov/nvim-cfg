local utils = require("custom.utils")
---@type LazySpec
return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>dq",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
            {
                "<leader>dw",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics of whole workspace (Trouble)",
            },
            {
                "<leader>dd",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        build = { "npm install -g markdownlint-cli", "npm install -g stylelint" },
        config = function() require("custom.configs.linter") end,
    },
    {
        "neovim/nvim-lspconfig",
        build = { "cargo install cargo-binstall && cargo binstall cargo-nextest -y --secure" },
        config = function()
            require("plugins.configs.lspconfig")
            require("custom.configs.lspconfig")
        end,
        keys = {
            {
                "gt",
                function() vim.lsp.buf.type_definition() end,
                { desc = "LSP: go to current symbol's type definition." },
            },
        },
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" },
        event = { "VeryLazy" },
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local configs = require("custom.configs")
            local lsp_cfg = require("custom.configs.lspconfig")

            local cfg = require("rustaceanvim.config")
            local lldb_path = utils.codelldb_path()
            vim.g.rustaceanvim = {
                dap = {
                    adapter = cfg.get_codelldb_adapter(lldb_path.codelldb_path, lldb_path.liblldb_path),
                },
                server = {
                    capabilities = lsp_cfg.capabilities,
                    settings = configs.rust_analyzer,
                },
            }
        end,
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("crates").setup() end,
    },
}
