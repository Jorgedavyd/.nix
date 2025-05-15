local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = vim.tbl_map(function (value)
        return { import = "jenci.lazy" .. value }
    end, { "", ".completion", ".lsp", ".motion", ".testing", ".ui" }),
    defaults = { lazy = false, version = false },
    checker = { enabled = true, notify = false },
    change_detection = { enabled = true, notify = false },
    rocks = { enabled = false },
    lockfile = os.getenv("HOME") .. ".nvim/lazy-lock.json",
    state = os.getenv("HOME") .. ".nvim/state.json",
})
