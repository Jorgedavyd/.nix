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

---helper function
---@param keymap string
---@param count number
---@param severity any
---@param opts any
local function jump_to_diagnostic(keymap, count, severity, opts)
    vim.keymap.set("n", keymap, function()
        vim.diagnostic.jump({
            count = count,
            severity = severity,
            float = {
                border = "rounded",
                source = "always"
            },
        })
    end, opts)
end

autocmd('LspAttach', {
    group = JenciAuGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        if not vim.endswith(e.file, "rs") then
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>vd", function()
                vim.diagnostic.open_float(nil, { focus = false })
            end, opts)
            jump_to_diagnostic("[e", -1, vim.diagnostic.severity.ERROR, opts)
            jump_to_diagnostic("]e", 1, vim.diagnostic.severity.ERROR, opts)
            jump_to_diagnostic("[w", -1, vim.diagnostic.severity.WARN, opts)
            jump_to_diagnostic("]w", 1, vim.diagnostic.severity.WARN, opts)
            jump_to_diagnostic("[i", -1, vim.diagnostic.severity.INFO, opts)
            jump_to_diagnostic("]i", 1, vim.diagnostic.severity.INFO, opts)
            jump_to_diagnostic("[h", -1, vim.diagnostic.severity.HINT, opts)
            jump_to_diagnostic("]h", 1, vim.diagnostic.severity.HINT, opts)
            jump_to_diagnostic("[d", -1, nil, opts)
            jump_to_diagnostic("]d", 1, nil, opts)
        end
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, opts)
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
