return {
    "iurimateus/luasnip-latex-snippets.nvim",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "lervag/vimtex",
    },
    keys = {
        { '<leader>ll', ':VimtexCompile<CR>' },
        { '<leader>lv', ':VimtexView<CR>' },

    },
    config = function()
        require("luasnip-latex-snippets").setup()
        require("luasnip").config.setup { enable_autosnippets = true }
        vim.g.vimtex_view_general_viewer = 'zathura'
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_view_method = 'general'
    end,
}
