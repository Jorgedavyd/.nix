return {
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

        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                    },
                },
            },
        }

        lspconfig.zls.setup {
            capabilities = capabilities,
            root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    enable_snippets = true,
                    warn_style = true,
                },
            },
        }
        vim.g.zig_fmt_parse_errors = 0
        vim.g.zig_fmt_autosave = 0

        lspconfig.clangd.setup {
            capabilities = capabilities,
            filetypes = { "c", "cpp", "cuda", "cu", "h" },
            cmd = {
                "clangd",
                "--header-insertion=never",
                "--clang-tidy",
                "--compile-commands-dir=build",
            },
            root_dir = lspconfig.util.root_pattern(".git", "compile_commands.json", "compile_flags.txt", "CMakeLists.txt"),
            settings = {
                clangd = {
                    fallbackFlags = {
                        "--std=c++17",
                        "--cuda-path=/opt/cuda",
                        "--cuda-gpu-arch=sm_89",
                        "-L/opt/cuda/lib",
                        "-I/opt/cuda/include",
                    },
                },
            },
        }

        lspconfig.pyright.setup {
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
        }
    end,
}
