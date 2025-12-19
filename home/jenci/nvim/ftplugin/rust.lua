local bufnr = vim.api.nvim_get_current_buf()
local set = vim.keymap.set;

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
        vim.cmd.RustLsp('renderDiagnostic current')
    end,
    { silent = true, buffer = bufnr }
)

set(
    "n",
    "<leader>vrd",
    function()
        vim.cmd.RustLsp('relatedDiagnostics')
    end,
    { silent = true, buffer = bufnr }
)
