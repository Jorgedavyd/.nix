return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>pf" , function() require("telescope.builtin").find_files() end, {} },
        { "<C-p>" , function ()
            require("telescope.builtin").git_files()
        end, {} },
        { "<leader>pws" , function()
            require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
        end , {}},
        { "<leader>pWs" , function()
            require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") })
        end , {}},
        { "<leader>ps" , function()
            require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end , {}},
        { "<leader>vh" , function()
            require("telescope.builtin").help_tags()
        end, {} }
    },

    config = function()
        require("telescope").setup({
            defaults = {
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                dynamic_preview_title = true,
                layout_config = {
                    width = 0.98,
                    height = 0.95,
                    horizontal = {
                        preview_width = 0.5,
                        mirror = false,
                    },
                    preview_cutoff = 1,
                },
                mappings = {
                    i = {
                        ["<C-j>"] = "move_selection_next",
                        ["<C-k>"] = "move_selection_previous",
                        ["<C-h>"] = "results_scrolling_left",
                        ["<C-l>"] = "results_scrolling_right",
                        ["<C-t>"] = "preview_scrolling_left",
                        ["<C-y>"] = "preview_scrolling_right",
                    },
                },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
                    ignore_builtin = true,
                },
            },
        })

    end
}

