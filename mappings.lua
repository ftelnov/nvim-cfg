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
    ["<C-s>"] = { "<cmd>wa <CR>", "Save all files." },
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
      "Show nearest test output.",
    },
    ["<leader>ts"] = {
      function()
        require("neotest").summary.toggle {}
      end,
      "Toggle tests summary.",
    },
    ["<leader>ta"] = {
      function()
        require("neotest").run.attach {}
      end,
      "Attach to the current test.",
    },
    ["<leader>tk"] = {
      function()
        require("neotest").run.stop()
      end,
      "Kill nearest test.",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
