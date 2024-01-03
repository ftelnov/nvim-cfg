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
}
