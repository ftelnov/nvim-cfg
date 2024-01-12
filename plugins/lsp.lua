---@type LazySpec
return {
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "<leader>dl",
                function() require("trouble").toggle("loclist") end,
                desc = "Trouble Toggle local list",
            },
            {
                "<leader>dw",
                function() require("trouble").toggle("workspace_diagnostics") end,
                desc = "Trouble Toggle local list",
            },
            {
                "<leader>dd",
                function() require("trouble").toggle("document_diagnostics") end,
                desc = "Trouble Toggle Document Diagnostics",
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
        version = "^3",
        ft = { "rust" },
        event = { "VeryLazy" },
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local configs = require("custom.configs")
            local lsp_cfg = require("custom.configs.lspconfig")

            vim.g.rustaceanvim = {
                server = {
                    on_attach = function(client, buf_nr)
                        lsp_cfg.on_attach(client, buf_nr)
                        vim.lsp.inlay_hint.enable(buf_nr, true)
                    end,
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
