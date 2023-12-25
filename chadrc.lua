---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

local function statusline_override()
  return {
    overriden_modules = function(modules)
      local config = require("core.utils").load_config().ui.statusline
      local sep_style = config.separator_style
      local default_sep_icons = {
        default = { left = "", right = "" },
        round = { left = "", right = "" },
        block = { left = "█", right = "█" },
        arrow = { left = "", right = "" },
      }
      local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]
      local sep_r = separators["right"]

      local function stbufnr()
        return vim.api.nvim_win_get_buf(vim.g.statusline_winid)
      end

      modules[2] = (function()
        local icon = " 󰈚 "
        local path = vim.api.nvim_buf_get_name(stbufnr())
        local name = (path == "" and "Empty ") or path:match "([^/\\]+)[/\\]*$"

        if name ~= "Empty " then
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")

          if devicons_present then
            local ft_icon = devicons.get_icon(name)
            icon = (ft_icon ~= nil and " " .. ft_icon) or icon
          end

          name = " " .. name .. " "
        end

        local MAX_FILEPATH_LENGTH = 50

        local relative_filepath = vim.fn.expand "%:."
        if relative_filepath:len() > MAX_FILEPATH_LENGTH then
          relative_filepath = "..." .. relative_filepath:sub(-MAX_FILEPATH_LENGTH, -1)
        end
        relative_filepath = " " .. relative_filepath .. " "
        return "%#St_file_info#" .. icon .. relative_filepath .. "%#St_file_sep#" .. sep_r
      end)()
    end,
  }
end

M.ui = {
  theme = "one_light",
  theme_toggle = { "one_light", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = statusline_override(),
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
M.mappings = require "custom.mappings"

return M
