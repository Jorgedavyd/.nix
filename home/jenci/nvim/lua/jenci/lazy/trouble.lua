return {
    "folke/trouble.nvim",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    keys = {
        { "<leader>t", function()
            require("trouble").toggle({mode = "diagnostics", filter = { buf = 0}})
        end },

        { "[t", function()
            require("trouble").next({skip_groups = true, jump = true});
        end },

        { "]t", function()
            require("trouble").prev({skip_groups = true, jump = true});
        end },
    },
    config = true,
}
