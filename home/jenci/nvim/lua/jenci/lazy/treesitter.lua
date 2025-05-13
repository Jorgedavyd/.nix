return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { 'nvim-treesitter/playground' },
    main = "nvim-treesitter.configs",
    dev = true,
    opts = {
        sync_install = false,
        auto_install = false,
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
--[[
            ensure_installed = {
                "python", "c", "lua", "cuda", "cpp", "zig",
                "rust", "go", "java", "sql", "cmake", "bash",
                "markdown_inline", "vimdoc", "vim", "toml",
                "csv", "json", "make", "dockerfile", "xml", "yaml",
                "rego"
            },
    ]]--
