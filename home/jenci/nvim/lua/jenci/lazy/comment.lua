return {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup({
            padding = true,
            sticky = true,
            ignore = nil,
            toggler = { line = '<leader>/' },
            opleader = { line = '<leader>/' },
            mappings = {
                basic = true,
                extra = false,
            },
            pre_hook = nil,
            post_hook = nil,
        })
    end,
}

