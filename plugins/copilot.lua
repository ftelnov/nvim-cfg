---@type LazySpec
return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "VeryLazy",
        config = function()
            require("copilot").setup({
                suggestion = { keymap = { accept = "<M-CR>" } },
            })
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "zbirenbaum/copilot.lua" },
            { "nvim-lua/plenary.nvim" },
        },
        opts = {
            debug = true,
        },
    },
    { "AndreM222/copilot-lualine" },
}
