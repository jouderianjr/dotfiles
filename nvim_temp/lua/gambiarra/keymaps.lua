local keymap = vim.api.nvim_set_keymap

local nkey = function(key, command, extra_opts)
    local default_opts = { noremap = true, silent = true }
    return keymap("n", key, command, vim.tbl_extend("force", default_opts, extra_opts))
end

nkey("<C-h>", "<C-w>h", {})
nkey("<C-j>", "<C-w>j", {})
nkey("<C-k>", "<C-w>k", {})
nkey("<C-l>", "<C-w>l", {})

-- Navigate buffers
nkey("<S-l>", ":bnext<CR>", {})
nkey("<S-h>", ":bprevious<CR>", {})

-- Move current line / block with Alt-j/k a la vscode.
nkey("<A-j>", ":m .+1<CR>==", {})
nkey("<A-k>", ":m .-2<CR>==", {})

nkey(";", "", {
    callback = function()
        require("telescope.builtin").git_files({ untracked_files = true })
    end,
})
