local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },
    -- Themes
    -- TODO: add gruvbox
    "Yazeed1s/oh-lucy.nvim",
    "rebelot/kanagawa.nvim",
    "L3MON4D3/LuaSnip",

    -- LSP stuff
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" }
        },
    },

    -- Treesitter stuff
    "nvim-treesitter/nvim-treesitter",

    { "ruifm/gitlinker.nvim",      dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-tree/nvim-tree.lua",   dependencies = { "kyazdani42/nvim-web-devicons" } },
    { "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } }
}

local opts = {}

require("lazy").setup(plugins, opts)
