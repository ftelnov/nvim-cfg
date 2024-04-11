local function showFugitiveGit()
    if vim.fn.FugitiveHead() ~= "" then
        vim.cmd([[
    Git
    " wincmd H  " Open Git window in vertical split
    " setlocal winfixwidth
    " vertical resize 31
    " setlocal winfixwidth
    setlocal nonumber
    setlocal norelativenumber
    ]])
    end
end

local function toggleFugitiveGit()
    if vim.fn.buflisted(vim.fn.bufname("fugitive:///*/.git//$")) ~= 0 then
        vim.cmd([[ execute ":bdelete" bufname('fugitive:///*/.git//$') ]])
    else
        showFugitiveGit()
    end
end

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
                "<leader>g",
                toggleFugitiveGit,
                desc = "Open vim fugitive panel",
            },
            {
                "<leader>gl",
                ":'<'>GBrowse!<CR>",
                desc = "Copy Git remote link to the selected lines.",
                mode = "v",
            },
            { "<leader>gl", ":.GBrowse!<CR>", desc = "Copy Git remote link to the current line." },
            { "<leader>gp", ":Git -c push.default=current push<CR>", desc = "Git push with automatic upstream" },
            {
                "<leader>gfp",
                ":Git -c push.default=current push --force<CR>",
                desc = "Git force push with automatic upstream",
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "┃" },
                    change = { text = "┃" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "┇" },
                },
            })
        end,
        keys = {
            {
                "<leader>hv",
                function() require("gitsigns").preview_hunk() end,
                desc = "Toggle Git preview for the current hunk.",
            },
            { "<leader>hr", function() require("gitsigns").reset_hunk() end, desc = "Git reset current hunk." },
            { "<leader>hs", function() require("gitsigns").stage_hunk() end, desc = "Git stage current hunk." },
            {
                "<leader>sd",
                function() require("gitsigns").toggle_deleted() end,
                desc = "Toggle Git deleted lines.",
            },
        },
    },
    {
        "sindrets/diffview.nvim",
        lazy = false,
        config = function()
            require("diffview").setup({
                view = {
                    merge_tool = {
                        layout = "diff3_mixed",
                    },
                },
            })
        end,
        keys = {
            { "<leader>gv", ":DiffviewOpen<CR>", desc = "Open diffview." },
        },
    },
}
