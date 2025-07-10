return {
    'nvimdev/dashboard-nvim',
    dependencies = { {'nvim-tree/nvim-web-devicons'}},
    event = 'VimEnter',
    config = function()
        local logo = [[
         ██╗███████╗███╗   ██╗ ██████╗██╗
         ██║██╔════╝████╗  ██║██╔════╝██║
         ██║█████╗  ██╔██╗ ██║██║     ██║
    ██   ██║██╔══╝  ██║╚██╗██║██║     ██║
    ╚█████╔╝███████╗██║ ╚████║╚██████╗██║
     ╚════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝╚═╝
        ]]
        logo = string.rep("\n", 8) .. logo .. "\n\n"
        require('dashboard').setup({
            theme = "doom",
            config = {
                header = vim.split(logo, "\n"),
                footer = {},
                vertical_center = true,
            }
        })
    end
}

