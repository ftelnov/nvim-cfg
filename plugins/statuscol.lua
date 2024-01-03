local function fold_col_enabled(_) return vim.api.nvim_get_option_value("foldenable", {}) end

---@type NvPluginSpec
return {
    "luukvbaal/statuscol.nvim",
    branch = "0.10",
    lazy = false,
    opts = function()
        local builtin = require("statuscol.builtin")
        return {
            relculright = true,
            bt_ignore = { "nofile", "prompt", "terminal", "packer" },
            ft_ignore = {
                "NvimTree",
                "dashboard",
                "nvcheatsheet",
                "dapui_watches",
                "dap-repl",
                "dapui_console",
                "dapui_stacks",
                "dapui_breakpoints",
                "dapui_scopes",
                "help",
                "vim",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "noice",
                "lazy",
                "toggleterm",
            },
            segments = {
                -- Segment: Fold Column
                { text = { builtin.foldfunc }, click = "v:lua.ScFa", condition = { fold_col_enabled } },
                -- Segment: Add padding
                -- Segment : Show signs with one character width
                {
                    sign = {
                        name = { ".*" },
                        maxwidth = 4,
                        colwidth = 4,
                    },
                    text = { "%s" },
                    auto = true,
                    click = "v:lua.ScSa",
                },
                -- Segment: Show line number
                {
                    text = { " ", " ", builtin.lnumfunc, " " },
                    click = "v:lua.ScLa",
                    condition = { true, builtin.not_empty },
                },
                -- Segment: Add padding
                {
                    text = { " " },
                    hl = "Normal",
                    condition = { true, builtin.not_empty },
                },
            },
        }
    end,
}
