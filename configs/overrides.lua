local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- primary
    "python-lsp-server",
    "clangd",
    "clang-format",
    "fortls",

    "lua-language-server",
    "gopls",

    -- misc
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",

    -- formats
    "json-lsp",
    "yaml-language-server",
    "marksman",
    "black",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },

  filters = { dotfiles = false, custom = { "^.git$" } },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
