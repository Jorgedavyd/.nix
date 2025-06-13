return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            ignore_filetypes = {},
            color = {
                suggestion_color = "#9ccfd8",
                cterm = 244,
            },
            log_level = "info",
            disable_inline_completion = false,
            disable_keymaps = true,
            condition = function()
                return false
            end
        })
    end,
}
