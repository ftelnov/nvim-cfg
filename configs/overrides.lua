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
        "json",
        "yaml",
        "fortran",
        "rust",
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
        "rust-analyzer",
        "asm-lsp",
        "codelldb",

        -- shell
        "bash-language-server",
        "shellcheck",
        "shfmt",

        "lua-language-server",
        "luacheck",
        "gopls",

        -- web stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "phpactor",
        "phpcs",
        "phpcbf",
        "prettier",
        "eslint_d",

        -- formats
        "json-lsp",
        "yamlfmt",
        "yaml-language-server",
        "marksman",
        "black",
        "taplo",
        "sqlfluff",
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
