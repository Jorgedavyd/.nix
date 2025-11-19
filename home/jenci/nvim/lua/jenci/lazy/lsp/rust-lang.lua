return {
    {
        'rust-lang/rust.vim',
        ft = { "rust" },
        config = function()
            vim.g.rustfmt_autosave = 1
            vim.g.rustfmt_emit_files = 1
            vim.g.rustfmt_fail_silently = 0
            vim.g.rust_clip_command = 'wl-copy'
        end
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^6',
        lazy = false,
        ft = { "rust" },
        config = function ()
            vim.g.rustaceanvim = {
                tools = {
                },
                server = {
                    default_settings = {
                        ['rust-analyzer'] = {
                        }
                    }
                },
                dap = {
                }
            }
        end
    },
    {
        'saecki/crates.nvim',
        dependencies = {
        },
        ft = {"toml"},
        config = function()
            require("crates").setup {
                completion = {
                    cmp = {
                        enabled = true
                    },
                },
            }
            require('cmp').setup.buffer({
                sources = { { name = "crates" }}
            })
        end
    },
}
