---@type NvPluginSpec
return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/nvim-nio",

        "rouge8/neotest-rust",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-rust"),
            },
        })
    end,
    keys = {
        {
            "<leader>tt",
            function() require("neotest").run.run() end,
            desc = "Run the nearest test.",
        },
        {
            "<leader>td",
            function() require("neotest").run.run(vim.fn.expand("%")) end,
            desc = "Run tests in the current file.",
        },
        {
            "<leader>tw",
            function() require("neotest").watch.watch() end,
            desc = "Watch tests.",
        },
        {
            "<leader>to",
            function() require("neotest").output.open({ enter = true }) end,
            desc = "Show nearest test output.",
        },
        {
            "<leader>ts",
            function() require("neotest").summary.toggle({}) end,
            desc = "Toggle tests summary.",
        },
        {
            "<leader>ta",
            function() require("neotest").run.attach({}) end,
            desc = "Attach to the current test.",
        },
        {
            "<leader>tk",
            function() require("neotest").run.stop() end,
            desc = "Kill nearest test.",
        },
    },
}
