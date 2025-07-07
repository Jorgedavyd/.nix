require("jenci.set")
require("jenci.remap")
require("jenci.lazy_init")

local augroup = vim.api.nvim_create_augroup
local JenciAuGroup = augroup('jenci', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = JenciAuGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('LspAttach', {
    group = JenciAuGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        if not vim.endswith(e.file, "rs") then
            vim.keymap.set("n", "K", function() vim.cmd[[Lspsaga hover_doc]] end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.cmd[[Lspsaga show_line_diagnostics ]] end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.cmd[[Lspsaga code_action ]] end, opts)
        end
        vim.keymap.set("n", "gd", function() vim.cmd[[Lspsaga goto_definition]] end, opts)
        vim.keymap.set("n", "gD", function() vim.cmd[[Lspsaga peek_definition]] end, opts)
        vim.keymap.set("n", "<leader>ic", function() vim.cmd[[Lspsaga incoming_calls]] end, opts)
        vim.keymap.set("n", "<leader>oc", function() vim.cmd[[Lspsaga outgoing_calls]] end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.cmd[[Lspsaga rename]] end, opts)
        vim.keymap.set("i", "<c-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

vim.api.nvim_create_autocmd("FileType", {
    group = JenciAuGroup,
    pattern = {"tex", "md"},
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
