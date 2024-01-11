local colors = {
    blue = "#4078f2",
    green = "#50a14f",
    purple = "#a626a4",
    red1 = "#e45649",
    orange = "#fcc01c",
    red2 = "#ca1243",
    yellow = "#c18401",
    fg = "#494b53",
    bg = "#fafafa",
    gray1 = "#696c77",
    gray2 = "#f0f0f0",
    gray3 = "#d0d0d0",
}

local function empty()
    local component = require("lualine.component"):extend()
    function component:draw(default_highlight)
        self.status = ""
        self.applied_separator = ""
        self:apply_highlights(default_highlight)
        self:apply_section_separators()
        return self.status
    end
    return component
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
    for name, section in pairs(sections) do
        local left = name:sub(9, 10) < "x"
        for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
            table.insert(section, pos * 2, { empty(), color = { fg = colors.fg, bg = colors.bg } })
        end
        for id, comp in ipairs(section) do
            if type(comp) ~= "table" then
                comp = { comp }
                section[id] = comp
            end
            comp.separator = left and { right = "" } or { left = "" }
        end
    end
    return sections
end

local function search_result()
    if vim.v.hlsearch == 0 then
        return ""
    end
    local last_search = vim.fn.getreg("/")
    if not last_search or last_search == "" then
        return ""
    end
    local searchcount = vim.fn.searchcount({ maxcount = 9999 })
    return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function buffer_number() return vim.api.nvim_get_current_buf() end

local function modified()
    if vim.bo.modified then
        return "+"
    elseif vim.bo.modifiable == false or vim.bo.readonly == true then
        return "-"
    end
    return ""
end

---@type LazyPluginSpec
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "onelight",
                component_separators = "",
                section_separators = { left = "", right = "" },
            },
            sections = process_sections({
                lualine_a = {
                    "mode",
                    -- { buffer_number, color = { fg = colors.fg, bg = colors.gray3 } }
                },
                lualine_b = {
                    "branch",
                    "diff",
                    {
                        "diagnostics",
                        sources = { "nvim_lsp", "nvim_diagnostic" },
                        sections = { "error" },
                        diagnostics_color = { error = { bg = colors.red1, fg = colors.fg } },
                    },
                    {
                        "diagnostics",
                        sources = { "nvim_lsp", "nvim_diagnostic" },
                        sections = { "warn" },
                        diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
                    },
                    { "filename", file_status = false, path = 1 },
                    { modified, color = { bg = colors.red1 } },
                    {
                        "%w",
                        cond = function() return vim.wo.previewwindow end,
                    },
                    {
                        "%r",
                        cond = function() return vim.bo.readonly end,
                    },
                    {
                        "%q",
                        cond = function() return vim.bo.buftype == "quickfix" end,
                    },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = { search_result, "filetype" },
            }),
            inactive_sections = {
                lualine_c = { "%f %y %m" },
                lualine_x = {},
            },
        })
    end,
}
