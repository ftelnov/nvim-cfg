---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
    theme = "github_light",
    theme_toggle = { "github_light", "github_light" },

    hl_override = highlights.override,
    hl_add = highlights.add,

    statusline = {
        enabled = false,
    },
    tabufline = {
        enabled = false,
    },
}

M.plugins = "custom.plugins"

M.lazy_nvim = {
    git = {
        timeout = 600,
    },
}

M.ui.extended_integrations = { "trouble", "notify" }

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
