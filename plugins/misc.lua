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
        config = function()
            vim.fn["mkdp#util#install"]()
            -- it is needed to work correctly with "clipboard-image".
            vim.g.mkdp_images_path = vim.fn.getcwd()
        end,
        keys = {
            { "<leader>mp", ":MarkdownPreviewToggle<CR>", desc = "Markdown Preview Toggle" },
        },
    },

    {
        "dfendr/clipboard-image.nvim",
        ft = { "markdown" },
        config = function()
            require("clipboard-image").setup({
                default = {
                    img_name = function()
                        vim.fn.inputsave()
                        local name = vim.fn.input("Name: ")
                        vim.fn.inputrestore()
                        return name
                    end,
                },
            })
        end,
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
