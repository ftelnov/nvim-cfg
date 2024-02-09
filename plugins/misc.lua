---@type LazySpec
return {
    -- Install a plugin
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function() require("better_escape").setup() end,
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        keys = {
            { "<leader>mp", ":MarkdownPreviewToggle<CR>", desc = "Markdown Preview Toggle" },
        },
    },

    { "tpope/vim-abolish", event = "VeryLazy" },
    { "tpope/vim-surround", event = "InsertEnter" },

    { "moll/vim-bbye", event = "VeryLazy" },

    -- For ASCII sequence coloring.
    {
        "m00qek/baleia.nvim",
        event = "VeryLazy",
        tag = "v1.4.0",
        config = function()
            local baleia = require("baleia").setup({})
            vim.api.nvim_create_user_command("AsciiRender", function() baleia.once(vim.fn.bufnr("%")) end, {})
        end,
    },
}
