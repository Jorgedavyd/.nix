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
    end, { "", ".completion", ".lsp", ".motion", ".testing", ".ui", ".ui.themes" }),
    change_detection = { notify = false },
    rocks = { enabled = false },
    dev = {
        path = "~/.local/share/nvim/nix",
        patterns = { "nvim-treesitter", "telescope-nvim" },
        fallback = false,
    }
})
