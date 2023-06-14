require('lualine').setup({
    options = {
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
    }
})
