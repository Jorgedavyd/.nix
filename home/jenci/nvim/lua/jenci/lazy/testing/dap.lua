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

        local exepath_or_binary = function(binary)
            local exepath = vim.fn.exepath(binary)
            if #exepath > 0 then return exepath else return nil end
        end

        local get_lldb_adapter = function()
            local result
            if vim.fn.executable('codelldb') == 1 then
                result = {
                    type = 'server',
                    host = '127.0.0.1',
                    port = '${port}',
                    executable = {
                        command = exepath_or_binary('codelldb'),
                        args = { '--port', '${port}' },
                    },
                }
            else
                local has_lldb_dap = vim.fn.executable('lldb-dap') == 1
                local has_lldb_vscode = vim.fn.executable('lldb-vscode') == 1
                if not has_lldb_dap and not has_lldb_vscode then
                    return result
                end
                local command = has_lldb_dap and 'lldb-dap' or 'lldb-vscode'
                result = {
                    type = 'executable',
                    command = exepath_or_binary(command),
                    name = 'lldb',
                }
            end
            return result
        end

        dap.adapters.codelldb = get_lldb_adapter()

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
        dap.configurations.java = {
            {
                type = 'java',
                request = 'launch',
                name = "Launch Current File",
                host = "127.0.0.1",
                port = "${port}",
                mainClass = function()
                    return vim.fn.input('Main class > ', '', 'file')
                end,
            }
        }

        dap.adapters.java = function(callback)
            require("jdtls").setup_dap({ hotcodereplace = 'auto' })
            callback({
                type = 'server',
                host = '127.0.0.1',
                port = '${port}'
            })
        end

    end,
}
