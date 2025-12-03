return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "mfussenegger/nvim-jdtls",
                ft = "java",
            },
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp_lsp = require("cmp_nvim_lsp")

            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
            )

            vim.lsp.config("tailwindcss", {})

            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
                root_markers = { 'package.json', '.yarn', 'tsconfig.json', 'jsconfig.json', { "flake.nix", "flake.lock", ".git" } },
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                        diagnostics = {
                            ignoredCodes = { 6133, 6196 },
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                        },
                    },
                },
            })

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                        },
                    },
                },
            })

            vim.lsp.config("nil_ls", {
                capabilities = capabilities,
                root_markers = { 'flake.nix', '.git' },
                filetypes = { "nix" },
                cmd = { "nil" },
            })

            vim.lsp.config("zls", {
                capabilities = capabilities,
                root_markers = { "build.zig", "zls.json", { "flake.nix", "flake.lock", ".git" } },
                settings = {
                    zls = {
                        enable_inlay_hints = true,
                        enable_snippets = true,
                        warn_style = true,
                    },
                },
            })
            vim.g.zig_fmt_parse_errors = 0
            vim.g.zig_fmt_autosave = 0

            vim.lsp.config("clangd", {
                capabilities = capabilities,
                filetypes = { "c", "cpp", "cuda", "cu", "h" },
                cmd = {
                    "clangd",
                    "--header-insertion=never",
                    "--clang-tidy",
                    "--compile-commands-dir=build",
                },
                root_markers = { "compile_commands.json", "compile_flags.txt", "CMakeLists.txt", { "flake.nix", "flake.lock", ".git" } },
                settings = {
                    clangd = {
                        fallbackFlags = {
                            "--std=c++17",
                            "--cuda-path=/opt/cuda",
                            "--cuda-gpu-arch=sm_89", -- TODO
                            "-L/opt/cuda/lib",
                            "-I/opt/cuda/include",
                        },
                    },
                },
            })

            vim.lsp.config("pyright", {
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                        },
                    },
                },
            })

            vim.filetype.add({
                filename = {
                    ["Tiltfile"] = "starlark",
                    ["tiltfile"] = "starlark",
                },
                extension = {
                    star = "starlark",
                    bzl = "starlark",
                }
            })

            vim.lsp.config("starlark_lsp", {
                cmd = { "tilt", "lsp", "start" },
                filetypes = { "starlark" },
                capabilities = capabilities,
                root_dir = vim.fs.root(0, { "Tiltfile", ".git" }),
            })

            vim.lsp.enable({
                "tailwindcss",
                "ts_ls",
                "lua_ls",
                "nil_ls",
                "zls",
                "clangd",
                "pyright",
                "starlark_lsp",
            })
        end,
    },
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                lightbulb = {
                    enable = false,
                },
                finder = {
                    max_height = 0.6,
                    keys = {
                        vsplit = 'v',
                    },
                }
            })
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        }
    }
}
