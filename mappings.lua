---@type MappingsTable
local M = {}

M.disabled = {
    n = {
        ["<leader>fa"] = "",
        ["<leader>td"] = "",
        ["<tab>"] = "",
        ["<S-tab>"] = "",
        ["<leader>x"] = "",
        ["<C-s>"] = "",
        ["<leader>h"] = "",
    },
}

M.general = {
    n = {
        ["<tab>"] = {
            ":bnext<CR>",
            "Goto next buffer",
        },
        ["<S-tab>"] = {
            ":bprev<CR>",
            "Goto prev buffer",
        },
        ["<leader>x"] = {
            ":Bdelete<CR>",
            "Close current buffer",
        },
        ["<leader><tab>"] = {
            ":wincmd w<CR>",
            "Focus on the floating window.",
        },

        ["<C-s>"] = { "<cmd>wa <CR>", "Save all files." },

        ["<leader>sd"] = {
            function() require("gitsigns").toggle_deleted() end,
            "Show Git deleted lines",
        },
        ["<leader>gh"] = {
            function() require("gitsigns").preview_hunk() end,
            "Toggle Git preview for the current hunk.",
        },
        ["<leader>hr"] = {
            function() require("gitsigns").reset_hunk() end,
            "Reset current hunk",
        },
        [";"] = { ":", "enter command mode", opts = { nowait = true } },

        -- close quickfix ASAP.
        ["cq"] = { ":cclose<CR>" },
        ["<leader>q"] = { ":tabclose<CR>", "Close current tabpage." },
    },
    v = {
        [">"] = { ">gv", "indent" },
    },
}

-- more keybinds!

return M
