return {
    "rose-pine/neovim",
    as = "rose-pine",
    opts = {
        variant = "main",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
            terminal = false,
            legacy_highlights = true,
            migrations = true,
        },

        styles = {
            bold = true,
            italic = false,
            transparency = true,
        },

        highlight_groups = {
            TelescopeBorder = { fg = "overlay", bg = "overlay" },
            TelescopeNormal = { fg = "subtle", bg = "overlay" },
            TelescopeSelection = { fg = "text", bg = "highlight_med" },
            TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
            TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

            TelescopeTitle = { fg = "base", bg = "love" },
            TelescopePromptTitle = { fg = "base", bg = "pine" },
            TelescopePreviewTitle = { fg = "base", bg = "iris" },

            TelescopePromptNormal = { fg = "text", bg = "surface" },
            TelescopePromptBorder = { fg = "surface", bg = "surface" },
        },
    },
    config = function ()
        vim.cmd.colorscheme("rose-pine")
    end
}
