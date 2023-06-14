vim.cmd.colorscheme('kanagawa-wave')

require("kanagawa").setup({
    overrides = function(colors)
        return { Visual = { bg = colors.palette.fujiGray } }
    end,
})

