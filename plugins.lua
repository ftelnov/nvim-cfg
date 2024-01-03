local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
    -- override plugin configs
    {
        "williamboman/mason.nvim",
        opts = overrides.mason,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = overrides.treesitter,
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = overrides.nvimtree,
    },

    {
        import = "custom.plugins",
    },
}

return plugins
