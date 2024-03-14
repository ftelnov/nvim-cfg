local prettier = { "prettierd", "prettier" }

local fprettify = {
    command = "fprettify",
    args = { "--stdout", "--silent", "$FILENAME" },
}

local default_cfg = {
    formatters = {
        fprettify = fprettify,
        rustfmt = {
            command = "rustfmt",
            args = { "--edition", "2021", "--emit", "stdout" },
        },
    },
    -- Map of filetype to formatters
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "black", "isort" },
        -- Use a sub-list to run only the first available formatter
        javascript = { prettier },
        typescript = { prettier },
        typescriptreact = { prettier },
        html = { prettier },
        css = { prettier },
        php = { "phpcsbf" },
        markdown = { prettier },
        json = { prettier },
        yaml = { "yamlfmt" },
        rust = { "rustfmt", "injected" },
        go = { "gofmt" },
        sh = { "shfmt" },
        zsh = { "shfmt" },
        fortran = { "fprettify" },
    },
    format_after_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return {
    cfg = default_cfg,
}
