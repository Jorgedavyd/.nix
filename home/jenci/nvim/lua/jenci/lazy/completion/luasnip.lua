return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")

        ls.config.set_config({
            history = false,
            updateevents = "TextChanged,TextChangedI",
        })

        require("luasnip.loaders.from_snipmate").load({ paths = {"~/.config/nvim/lua/jenci/lazy/snippets/latex" }})

        for _, file in ipairs(vim.api.nvim_get_runtime_file("lua/jenci/lazy/snippets/*.lua", true)) do
            loadfile(file)()
        end

        vim.keymap.set({"i", "s"}, "<C-k>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, {silent = true})

        vim.keymap.set({"i", "s"}, "<C-j>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, {silent = true})
    end
}
