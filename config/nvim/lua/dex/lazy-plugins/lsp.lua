local M = {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        config = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    }
}

return M
