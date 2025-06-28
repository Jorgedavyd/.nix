local path = vim.fn.expand("%")

return {
    "nvim-neotest/neotest",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "marilari88/neotest-vitest",
        "nvim-neotest/neotest-plenary",
        "nvim-neotest/neotest-python",
        "mrcjkb/rustaceanvim",
        "lawrence-laz/neotest-zig",
        "alfaix/neotest-gtest",
        "nvim-treesitter/nvim-treesitter"
    },
    opts = {
        adapters = {
            ["neotest-vitest"] = {},
            ["neotest-plenary"] = {},
            ["neotest-python"] = {
                runner = "pytest",
                python = vim.fn.exepath("python"),
            },
            ["rustaceanvim.neotest"] = {},
            ["neotest-zig"] = {},
            ["neotest-gtest"] = {},
            ["neotest-java"] = {},
            ["neotest-jest"] = {
                jestCommand = "npm test --",
                jestConfigFile = "custom.jest.config.ts",
                env = { CI = true },
                cwd = function(_)
                    return vim.fn.getcwd()
                end,
            }
        },
        discovery = {
            filter_dir = function(name, rel_path, root)
                return name ~= "env"
            end,
        }
    },
    keys = {
        {
            "<leader>sm", function()
                require("neotest").summary.toggle()
            end
        },
        {
            "<leader>rl", function()
                require("neotest").run.run_last({strategy = 'dap'})
            end
        },
        {
            "<leader>r", function()
                require("neotest").run.run({strategy = 'dap'})
            end
        },
        {
            "<leader>ot", function()
                require("neotest").output.open({
                    enter = true,
                    last_run = true,
                    auto_close = true,
                })
            end
        },
        {
            "<leader>rp", function()
                require("neotest").run.run({
                    path,
                    strategy = 'dap'
                })
            end
        },
    }
}
