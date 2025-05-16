return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "python", "c", "lua", "cuda", "cpp", "zig",
            "rust", "go", "java", "sql", "cmake", "bash",
            "markdown_inline", "vimdoc", "vim", "toml",
            "csv", "json", "make", "dockerfile", "xml", "yaml",
            "rego"
        },
        sync_install = true,
        auto_install = true,
        indent = {
            enable = true
        },
        highlight = {
            enable = true,
            disable = {"latex"},
            additional_vim_regex_highlighting = false,
        }
    }
}
