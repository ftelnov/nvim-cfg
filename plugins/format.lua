---@type NvPluginSpec
return {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    build = { "pip install fprettify --user" },
    config = function() require("conform").setup(require("custom.configs.format").cfg) end,
    keys = {
        {
            "<leader>fm",
            function() require("conform").format() end,
            desc = "Format current buffer.",
        },
        {
            "<leader>fm",
            function() require("conform").format() end,
            desc = "Format selected lines.",
            mode = "v",
        },
        {
            "<leader>fmi",
            function() require("conform").format({ { formatters = { "injected" } } }) end,
            desc = "Format with injected formatter(useful for raw lines processing).",
            mode = "v",
        },
    },
}
