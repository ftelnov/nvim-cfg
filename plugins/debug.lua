local utils = require("custom.utils")

---@type LazySpec
return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        keys = {
            { "<leader>pc", function() require("dap").continue() end, desc = "Debug continue" },
            {
                "<leader>b",
                function() require("persistent-breakpoints.api").toggle_breakpoint() end,
                desc = "Debug toggle breakpoint",
            },
            {
                "<leader>B",
                function() require("persistent-breakpoints.api").set_conditional_breakpoint() end,
                desc = "Debug set conditional breakpoint",
            },
            {
                "<leader>bc",
                function() require("persistent-breakpoints.api").clear_all_breakpoints() end,
                desc = "Debug clear all breakpoints",
            },
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

            dap.adapters.gdb = {
                type = "executable",
                command = "rust-gdb",
                args = { "-i", "dap" },
            }

            dap.configurations.rust = {
                {
                    name = "Attach to process (gdb)",
                    type = "gdb",
                    request = "attach",
                    pid = require("dap.utils").pick_process,
                },
                {
                    name = "Launch (gdb)",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
                {
                    name = "Attach to process (codelldb)",
                    type = "codelldb",
                    request = "attach",
                    pid = require("dap.utils").pick_process,
                },
                {
                    name = "Launch (codelldb)",
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
        dependencies = {
            {
                "Weissle/persistent-breakpoints.nvim",
                config = function()
                    require("persistent-breakpoints").setup({
                        load_breakpoints_event = { "BufReadPost" },
                    })
                end,
            },
        },
    },
}
