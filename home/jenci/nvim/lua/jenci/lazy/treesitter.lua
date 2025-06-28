---@diagnostic disable: missing-fields
return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "nix",
                "rust", "c", "cuda", "cpp", "zig",
                "python", "lua",
                "java", "sql", "bash",
                "javascript", "typescript",
                "vimdoc", "vim",
                "make", "cmake", "markdown_inline",
                "csv",
                "json", "xml", "yaml", "toml"
            },
            sync_install = true,
            auto_install = false,
            indent = { enable = true },
            highlight = {
                enable = true,
                disable = {"latex"},
                additional_vim_regex_highlighting = false,
            }
        })
    end
}
