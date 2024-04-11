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
        ["<leader>b"] = "",
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
