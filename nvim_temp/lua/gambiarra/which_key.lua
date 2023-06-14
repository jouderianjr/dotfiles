local wk = require("which-key")

local telescope_builtin = require("telescope.builtin")

local normal_mapping = {
    e = {
        name = "Explorer",
        t = { ":NvimTreeToggle<CR>", "Toggle" },
        f = { ":NvimTreeFocus<CR>", "Toggle" },

    },
    l = {
        name = "Lsp",
        a = { vim.lsp.buf.code_action, "Code action" },
        r = { vim.lsp.buf.rename, "Rename" }

    },
    s = {
        name = "Search",
        f = { telescope_builtin.find_files, "Find file" },
        g = { telescope_builtin.git_files, "Find git file" },
        t = { telescope_builtin.live_grep, "Search text" },
    },
    b = {
        name = "Buffers",
        o = {
            function() telescope_builtin.buffers({ theme = "dropdown", initial_mode = "normal" }) end,
            "List",
        }
    },
    o = { ":e#<CR>", "Go to last buffer" },
    g = {
        name = "Git",
        y = {
            function()
                require("gitlinker").get_buf_range_url("v",
                    { action_callback = require("gitlinker.actions").copy_to_clipboard })
            end,
            "Get remove git link"
        }
    },
    m = {
        name = "Miscellaneous",
        j = { ":%!jq .<cr>", "Format json" }
    },
    w = { ":w<cr>", "Save file" },
    c = { ":bd<cr>", "Close buffer" },
    q = { ":q<cr>", "Close window" }

}

local mapping_opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}

local virtual_mapping = {
    m = {
        name = "Miscellaneous",
        j = { ":'<,'>!jq<cr>", "Format Selected json" }
    }
}

local vmapping_opts = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
}


wk.register(normal_mapping, mapping_opts)
wk.register(visual_mapping, vmapping_opts)

