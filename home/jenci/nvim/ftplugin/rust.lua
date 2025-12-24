local bufnr = vim.api.nvim_get_current_buf()
local set = vim.keymap.set;

---helper function
---@param keymap string
---@param count number
---@param severity any
local function jump_to_diagnostic(keymap, count, severity)
    vim.keymap.set("n", keymap, function()
        vim.diagnostic.jump({
            count = count,
            severity = severity,
        })
        vim.cmd.RustLsp({ 'renderDiagnostic', 'current' })
    end, { silent = true, buffer = bufnr })
end

jump_to_diagnostic("[e", -1, vim.diagnostic.severity.ERROR)
jump_to_diagnostic("]e", 1, vim.diagnostic.severity.ERROR)
jump_to_diagnostic("[w", -1, vim.diagnostic.severity.WARN)
jump_to_diagnostic("]w", 1, vim.diagnostic.severity.WARN)
jump_to_diagnostic("[i", -1, vim.diagnostic.severity.INFO)
jump_to_diagnostic("]i", 1, vim.diagnostic.severity.INFO)
jump_to_diagnostic("[h", -1, vim.diagnostic.severity.HINT)
jump_to_diagnostic("]h", 1, vim.diagnostic.severity.HINT)
jump_to_diagnostic("[d", -1, nil)
jump_to_diagnostic("]d", 1, nil)

set(
    "n",
    "<leader>vca",
    function()
        vim.cmd.RustLsp('codeAction') -- overrides the builtin lsp code action
    end,
    { silent = true, buffer = bufnr }
)

set(
    "n",
    "K",
    function()
        vim.cmd.RustLsp({'hover', 'actions'}) -- overrides the lsp hover
    end,
    { silent = true, buffer = bufnr }
)

set(
    "n",
    "<leader>me",
    function()
        vim.cmd.RustLsp('expandMacro')
    end,
    { silent = true, buffer = bufnr })

set(
    "n",
    "<leader>mr",
    function()
        vim.cmd.RustLsp('rebuildProcMacros')
    end,
    { silent = true, buffer = bufnr }
)

set(
    "n",
    "J",
    function()
        vim.cmd.RustLsp('joinLines')
    end,
    { silent = true, buffer = bufnr }
)

set(
    "n",
    "<leader>hws",
    function()
        vim.cmd.RustLsp('openDocs')
    end,
    { silent = true, buffer = bufnr }
)

set(
    "n",
    "<leader>vd",
    function()
        vim.cmd.RustLsp({ 'renderDiagnostic', 'current' })
    end,
    { silent = true, buffer = bufnr }
)
