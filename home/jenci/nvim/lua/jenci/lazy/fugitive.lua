return {
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs", function() vim.cmd.Git() end }
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {}
        end
    }
}
