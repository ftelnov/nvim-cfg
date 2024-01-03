---@type NvPluginSpec
return {
    "kevinhwang91/nvim-ufo",
    lazy = false,
    init = function()
        vim.o.foldcolumn = "auto"
        vim.o.foldlevel = 99 -- Using ufo provider need a large value
        vim.o.foldlevelstart = 99
        vim.o.foldnestmax = 0
        vim.o.foldmethod = "indent"

        vim.opt.fillchars = {
            fold = " ",
            foldopen = "-",
            foldsep = " ",
            foldclose = "+",
            stl = " ",
            eob = " ",
        }
    end,
    opts = {
        close_fold_kinds = { "imports" },
        provider_selector = function() return { "treesitter", "indent" } end,
    },
    dependencies = {
        "kevinhwang91/promise-async",
    },
    keys = {
        {
            "<leader>tf",
            function()
                local new_value = not vim.api.nvim_get_option_value("foldenable", {})
                local ufo = require("ufo")
                vim.api.nvim_set_option_value("foldenable", new_value, {})
                if new_value then
                    ufo.openAllFolds()
                else
                    ufo.closeAllFolds()
                end
            end,
            { desc = "Toggle fold column." },
        },
    },
}
