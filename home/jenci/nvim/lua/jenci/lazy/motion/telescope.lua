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

    opts = {
        defaults = {
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
                prompt_position = "top",
                preview_cutoff = 120,
            },
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
        },
        pickers = {
            colorscheme = {
                enable_preview = true,
                ignore_builtins = true
            }
        }
    }
}

