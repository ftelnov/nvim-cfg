---@type LazySpec
return {
    {
        "tpope/vim-fugitive",
        lazy = false,
        -- config = function()
        --
        -- end,
        dependencies = {
            "tpope/vim-rhubarb",
            "shumphrey/fugitive-gitlab.vim",
        },
        keys = {
            {
                "<leader>gl",
                ":'<'>GBrowse!<CR>",
                desc = "Copy Git remote link to the selected lines.",
                mode = "v",
            },
            { "<leader>gl", ":.GBrowse!<CR>", desc = "Copy Git remote link to the current line." },
            { "<leader>gp", ":Git -c push.default=current push<CR>", desc = "Git push with automatic upstream" },
        },
    },
    {
        "sindrets/diffview.nvim",
        lazy = false,
        -- config = function()
        --
        -- end,
    },
}
