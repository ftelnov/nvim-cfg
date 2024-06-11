local prettier = { "prettierd", "prettier" }
local cfg = {
    -- Map of filetype to formatters
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        javascript = { prettier },
        typescript = { prettier },
        typescriptreact = { prettier },
        html = { prettier },
        css = { prettier },
        php = { "phpcsbf" },
        markdown = { prettier },
        json = { prettier },
        yaml = { "yamlfmt" },
        toml = { "taplo" },
        rust = { "rustfmt", "injected" },
        go = { "gofmt" },
        sh = { "shfmt" },
        zsh = { "shfmt" },
        fortran = { "fprettify" },
        sql = { "sqlfluff" },
    },
    format_after_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        return { timeout_ms = 500, lsp_fallback = true }
    end,
}

local function setup_formatter_config()
    local conform_utils = require("conform.util")

    local fprettify = {
        command = "fprettify",
        args = { "--stdout", "--silent", "$FILENAME" },
    }

    local sqlfluff = {
        command = "sqlfluff",
        args = { "fix", "-" },
        stdin = true,
        cwd = conform_utils.root_file({
            ".sqlfluff",
            "pep8.ini",
            "pyproject.toml",
            "setup.cfg",
            "tox.ini",
        }),
        require_cwd = false,
    }

    return {
        formatters = {
            fprettify = fprettify,
            rustfmt = {
                command = "rustfmt",
                args = { "--edition", "2021", "--emit", "stdout" },
            },
            sqlfluff = sqlfluff,
        },
        formatters_by_ft = cfg.formatters_by_ft,
        format_after_save = cfg.format_after_save,
    }
end

return {
    setup = setup_formatter_config,
    cfg = cfg,
}
