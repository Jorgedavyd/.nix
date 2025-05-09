return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
        {"<space>?", function () require("dapui").eval(nil, {enter = true}) end, "n", noremap = true, silent = true, desc = "Dap UI enter debug session"},
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup({ dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} })
        require("nvim-dap-virtual-text").setup({})
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
    end
}
