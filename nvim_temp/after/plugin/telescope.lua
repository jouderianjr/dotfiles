local actions = require("telescope.actions")

require('telescope').setup {
    defaults = {
        selection_caret = "> ",
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev
            }
        }
    }
}

