return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-telescope/telescope-dap.nvim",
        "jbyuki/one-small-step-for-vimkind",
        "mrcjkb/rustaceanvim",
        "mfussenegger/nvim-dap-python",
    },
    keys = {
        {"<F1>", function() require("dap").continue() end},
        {"<F2>", function() require("dap").step_into() end},
        {"<F3>", function() require("dap").step_over() end},
        {"<F4>", function() require("dap").step_out() end},
        {"<F5>", function() require("dap").step_back() end},
        {"<F6>", function() require("dap").restart() end},
        { "<leader>cb", function ()
            vim.ui.input({prompt = "Condition: "}, function (condition)
                require("dap").toggle_breakpoint(condition)
            end)
        end, "n", noremap = true, silent = true, desc = "Debug adapter protocol breakpoint on condition" },
        { "<leader>b", function() require("dap").toggle_breakpoint() end, "n",  noremap = true, silent = true, desc = "Debug adapter protocol breakpoint" },
        { '<leader>cB', function() require("dap").clear_breakpoints() end, "n", noremap = true, silent = true, desc = "Debug adapter protocol clear breakpoints" }
    },
    config = function()
        local dap = require("dap")
        require("dap-python").setup("/usr/bin/python3.10")

        dap.configurations.lua = {
            {
                type = "nlua",
                request = "attach",
                name = "Attach to running Neovim instance",
            },
        }

        dap.adapters.nlua = function(callback, config)
            callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
        end

        dap.adapters.codelldb = {
          type = 'executable',
          command = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/codelldb/adapter/codelldb"),
          name = 'codelldb'
        }

        dap.configurations.cpp = {
            {
                name = "Launch",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                args = {},
                runInTerminal = false,
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.zig = dap.configurations.cpp
        dap.configurations.cuda = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
    end,
}
