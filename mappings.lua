---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>fm"] = "",
    ["<leader>fa"] = "",
    ["<leader>td"] = "",
    ["<tab>"] = "",
    ["<S-tab>"] = "",
    ["<leader>x"] = "",
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
      ":bd<CR>",
      "Close current buffer",
    },
    ["<leader><tab>"] = {
      ":wincmd w<CR>",
      "Focus on the floating window.",
    },
    ["<leader>tf"] = {
      function()
        local new_value = not vim.api.nvim_get_option_value("foldenable", {})
        local ufo = require "ufo"
        vim.api.nvim_set_option_value("foldenable", new_value, {})
        if new_value then
          ufo.openAllFolds()
        else
          ufo.closeAllFolds()
        end
      end,
    },
    ["gt"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP: go to current symbol's type definition.",
    },

    -- remaps
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "Format with conform",
    },
    ["<leader>sd"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Show Git deleted lines",
    },
    ["<leader>gh"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Toggle Git preview for the current hunk.",
    },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- LiveGrep with args is more powerful, as supports ripgrep filters.
    ["<leader>fa"] = { ":Telescope live_grep_args live_grep_args<CR>", "Telescope LiveGrep With Args" },
    -- close quickfix ASAP.
    ["cq"] = { ":cclose<CR>" },

    -- Troubles checks.
    ["<leader>dl"] = {
      function()
        require("trouble").toggle "loclist"
      end,
      "Trouble Toggle Loclist",
    },
    ["<leader>dw"] = {
      function()
        require("trouble").toggle "workspace_diagnostics"
      end,
      "Trouble Toggle Workspace Diagnostics",
    },
    ["<leader>dd"] = {
      function()
        require("trouble").toggle "document_diagnostics"
      end,
      "Trouble Toggle Document Diagnostics",
    },

    ["<leader>mp"] = {
      ":MarkdownPreviewToggle<CR>",
      "Markdown Preview Toggle",
    },
    ["<leader>tt"] = {
      function()
        require("neotest").run.run()
      end,
      "Run the nearest test.",
    },
    ["<leader>td"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "Run tests in the current file.",
    },
    ["<leader>tw"] = {
      function()
        require("neotest").watch.watch()
      end,
      "Watch tests.",
    },
    ["<leader>to"] = {
      function()
        require("neotest").output.open { enter = true }
      end,
      "Show test output.",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
