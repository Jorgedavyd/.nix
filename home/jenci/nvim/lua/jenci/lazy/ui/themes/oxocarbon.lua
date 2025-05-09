return {
    "nyoom-engineering/oxocarbon.nvim",
    config = function ()
        local oxocarbon = require("oxocarbon").oxocarbon
        vim.api.nvim_set_hl(0, "Italic", {fg = oxocarbon.none, bg = oxocarbon.none, italic = false})
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end
}
