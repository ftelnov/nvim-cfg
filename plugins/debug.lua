local utils = require("custom.utils")

---@type LazySpec
return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        keys = {
            { "<leader>pc", function() require("dap").continue() end, desc = "Debug continue" },
            { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "Debug toggle breakpoint" },
            { "<leader>B", function() require("dap").set_breakpoint() end, desc = "Debug set breakpoint" },
            {
                "<leader>pm",
                function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
                desc = "Debug set breakpoint log message",
            },
            { "<leader>pr", function() require("dap").repl.open() end, desc = "Debug open repl" },
            { "<leader>pl", function() require("dap").run_last() end, desc = "Debug run last" },
            {
                "<leader>ph",
                function() require("dap.ui.widgets").hover() end,
                desc = "Debug hover widget",
                mode = { "v", "n" },
            },
            {
                "<leader>pp",
                function() require("dap.ui.widgets").preview() end,
                desc = "Debug preview",
                mode = { "v", "n" },
            },

            { "<F6>", function() require("dap").step_over() end, desc = "Debug step over" },
            { "<F7>", function() require("dap").step_into() end, desc = "Debug step into" },
            { "<F8>", function() require("dap").step_out() end, desc = "Debug step out" },
        },
        config = function(_opts)
            local dap = require("dap")
            local codelldb_path = utils.codelldb_path()

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = codelldb_path.codelldb_path,
                    args = { "--port", "${port}" },
                },
            }

            dap.configurations.rust = {
                {
                    name = "Attach to process",
                    type = "codelldb",
                    request = "attach",
                    pid = require("dap.utils").pick_process,
                },
                {
                    name = "Launch",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
            }
        end,
    },
}
