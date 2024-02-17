-- HBAC helps keeping only needed amount of buffers opened.

---@type NvPluginSpec
return {
    "axkirillov/hbac.nvim",
    lazy = false,
    config = function()
        local autocmd = vim.api.nvim_create_autocmd

        autocmd("BufWritePost", {
            callback = function(ev)
                local state = require("hbac.state")
                local actions = require("hbac.command.actions")
                if state.is_pinned(ev.buf) then
                    actions.toggle_pin(ev.buf)
                end
            end,
        })

        require("hbac").setup({
            autoclose = true, -- set autoclose to false if you want to close manually
            threshold = 6, -- hbac will start closing unedited buffers once that number is reached
            close_command = function(buffnr) vim.cmd.bd({ args = { buffnr } }) end,
        })
    end,
}
