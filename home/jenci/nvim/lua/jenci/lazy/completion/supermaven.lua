return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<C-s>",
                clear_suggestion = "<C-]>",
                accept_word = "<C-[>",
            },
            ignore_filetypes = {},
            color = {
                suggestion_color = "#6e6a86",
                cterm = 244,
            },
            log_level = "info",
            disable_inline_completion = false,
            disable_keymaps = false,
        })
    end,
}
